import "dart:convert";

import "package:auto_route/auto_route.dart";
import "package:currency_text_input_formatter/currency_text_input_formatter.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_image_map/flutter_image_map.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:intl/intl.dart" as intl;
import "package:revogarageapp/app/data/models/photo_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_form/bloc/vehicle_damage_form_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/bloc/vehicle_damage_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/damage_photo_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/vehicle_damage_list_short_dto.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/core/services/image_picker_service.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleDamageScreen extends StatefulWidget {
  const VehicleDamageScreen({required this.vehicleId, this.damageId, super.key});
  final int vehicleId;
  final int? damageId;
  bool get isEditMode => damageId != null;

  @override
  State<VehicleDamageScreen> createState() => _VehicleDamageScreenState();
}

class _VehicleDamageScreenState extends State<VehicleDamageScreen> {
  late final TextEditingController _damageName;
  late final TextEditingController _damageCost;
  late final TextEditingController _damageNote;
  VehicleDamageListShortDto? damage;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _imageList = <PhotoDto>[];
  final imageMapKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _damageName = TextEditingController();
    _damageCost = TextEditingController();
    _damageNote = TextEditingController();
    if (widget.isEditMode) {
      final damageList = getIt<VehicleDamageListBloc>().state.damageList;
      damage = damageList.firstWhere((final damage) => damage.id == widget.damageId);

      _damageName.text = damage?.name ?? "";
      _damageCost.text = damage?.price.toString() ?? "";
      _damageNote.text = damage?.description?.toString() ?? "";
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<VehicleDamageFormBloc, VehicleDamageFormState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          getIt<VehicleDamageListBloc>().add(GetVehicleDamageListEvent(widget.vehicleId));
          context.router.pop();
        }
      },
      builder: (final context, final state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              RevoScreenHeader(
                title: widget.isEditMode == true
                    ? AppLocalizations.of(context).edit_damage
                    : AppLocalizations.of(context).create_damage,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ImageMap(
                      key: imageMapKey,
                      imagePath: Images.damageMap,
                      imageSize: const Size(3719, 2329),
                      onTap: (final i) {
                        setState(() {
                          _damageName.text = damageParts[i];
                        });
                      },
                      regions: polygonRegions,
                      regionColors: colors,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      controller: _damageName,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).select_damage,
                      ),
                      validator: RequiredValidator(
                        errorText: AppLocalizations.current.empty_error,
                      ),
                    ),
                    TextFormField(
                      controller: _damageCost,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).damage_cost,
                        suffixText: AppLocalizations.of(context).chf,
                      ),
                      validator: RequiredValidator(
                        errorText: AppLocalizations.current.empty_error,
                      ),
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          decimalDigits: 0,
                          symbol: "",
                        )
                      ],
                    ),
                    TextFormField(
                      controller: _damageNote,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).damage_note,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (widget.isEditMode ? damage?.photos?.isNotEmpty ?? false : _imageList.isNotEmpty)
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        physics: const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                        shrinkWrap: true,
                        itemCount: widget.isEditMode ? damage?.photos?.length ?? 0 : _imageList.length,
                        itemBuilder: (final BuildContext context, final int index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.memory(
                                    gaplessPlayback: true,
                                    base64Decode(
                                      widget.isEditMode ? damage!.photos![index].base64 : _imageList[index].base64,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    right: -4,
                                    bottom: -4,
                                    child: IconButton(
                                      onPressed: () {
                                        if (widget.isEditMode) {
                                          setState(() {
                                            getIt<VehicleDamageFormBloc>().add(
                                              DeleteDamagePhotoEvent(
                                                damage!.photos![index].id,
                                                widget.vehicleId,
                                              ),
                                            );
                                          });
                                        } else {
                                          setState(() {
                                            _imageList.removeAt(index);
                                          });
                                        }
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.photo_album_outlined),
                            onPressed: () {
                              final service = getIt<ImagePickerService>();
                              service.pickMultiImage().then((final value) async {
                                //todo
                                for (final file in value) {
                                  if (widget.isEditMode) {
                                    getIt<VehicleDamageFormBloc>().add(
                                      AddDamagePhotoEvent(
                                        damage!.id,
                                        file,
                                        widget.vehicleId,
                                      ),
                                    );
                                  } else {
                                    final base64 = await service.filetoBase64(file);
                                    setState(() {
                                      _imageList.add(base64);
                                    });
                                  }
                                }
                              });
                            },
                            label: Text(
                              AppLocalizations.of(context).upload_photo.toUpperCase(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.photo_camera_outlined),
                            onPressed: () {
                              final service = getIt<ImagePickerService>();
                              service.takePhoto().then((final file) async {
                                if (file != null) {
                                  if (widget.isEditMode) {
                                    getIt<VehicleDamageFormBloc>().add(
                                      AddDamagePhotoEvent(
                                        damage!.id,
                                        file,
                                        widget.vehicleId,
                                      ),
                                    );
                                  } else {
                                    final base64 = await service.filetoBase64(file);
                                    setState(() {
                                      _imageList.add(base64);
                                    });
                                  }
                                }
                              });
                            },
                            label: Text(
                              AppLocalizations.of(context).take_photo.toUpperCase(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: state.status == EventStatus.processing
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.isEditMode) {
                              getIt<VehicleDamageFormBloc>().add(
                                UpdateDamageEvent(
                                  VehicleDamageListShortDto(
                                    id: damage!.id,
                                    name: _damageName.text.trim(),
                                    description: _damageNote.text.trim(),
                                    vehicleId: widget.damageId!,
                                    price: intl.NumberFormat().parse(_damageCost.text).toDouble(),
                                  ),
                                ),
                              );
                            } else {
                              getIt<VehicleDamageFormBloc>().add(
                                CreateDamageEvent(
                                  vehicleId: widget.vehicleId,
                                  name: _damageName.text.trim(),
                                  description: _damageNote.text.trim(),
                                  price: intl.NumberFormat().parse(_damageCost.text).toDouble(),
                                  photos: _imageList.isNotEmpty
                                      ? _imageList.map((final e) => DamagePhotoDto(0, e.name, e.base64)).toList()
                                      : null,
                                ),
                              );
                            }
                          }
                        },
                  child: state.status == EventStatus.processing
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(),
                        )
                      : Text(AppLocalizations.of(context).save),
                ),
              ),
              const SizedBox(height: 8),
              if (widget.isEditMode)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      getIt<VehicleDamageFormBloc>().add(DeleteDamageEvent(damage!.id));
                    },
                    label: Text(
                      AppLocalizations.of(context).delete.toUpperCase(),
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  void showSnackBarOnlyFivePictureAllowed() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).you_cannot_upload_more_than_five_photos)));
  }
}

final List<List<Offset>> vehiclePartPoints = [
  [
    const Offset(1687, 899),
    const Offset(1685, 1442),
    const Offset(2409, 1429),
    const Offset(2398, 891),
  ],
  [
    const Offset(3268, 947),
    const Offset(3531, 940),
    const Offset(3521, 662),
    const Offset(3274, 663),
  ],
  [
    const Offset(3263, 990),
    const Offset(3266, 1320),
    const Offset(3529, 1329),
    const Offset(3517, 995),
  ],
  [
    const Offset(3261, 1342),
    const Offset(3526, 1342),
    const Offset(3527, 1634),
    const Offset(3289, 1629),
  ],
  [
    const Offset(59, 589),
    const Offset(64, 980),
    const Offset(430, 965),
    const Offset(402, 597),
  ],
  [
    const Offset(61, 998),
    const Offset(370, 981),
    const Offset(381, 1412),
    const Offset(58, 1389),
  ],
  [
    const Offset(392, 1404),
    const Offset(93, 1406),
    const Offset(88, 1737),
    const Offset(417, 1714),
  ],
  [
    const Offset(1236, 693),
    const Offset(1251, 1627),
    const Offset(778, 1615),
    const Offset(777, 725),
  ],
  [
    const Offset(1034, 2002),
    const Offset(1034, 2300),
    const Offset(1384, 2322),
    const Offset(1344, 1992),
  ],
  [
    const Offset(1056, 0),
    const Offset(1048, 298),
    const Offset(1361, 304),
    const Offset(1355, 20),
  ],
  [
    const Offset(2301, 2020),
    const Offset(2304, 2313),
    const Offset(2616, 2301),
    const Offset(2565, 2011),
  ],
  [
    const Offset(2293, 4),
    const Offset(2299, 304),
    const Offset(2618, 309),
    const Offset(2591, 23),
  ],
  [
    const Offset(1447, 1886),
    const Offset(1446, 2186),
    const Offset(1928, 2192),
    const Offset(1925, 1883),
  ],
  [
    const Offset(1969, 1874),
    const Offset(1963, 2211),
    const Offset(2276, 2211),
    const Offset(2336, 1855),
  ],
  [
    const Offset(1443, 87),
    const Offset(1445, 426),
    const Offset(1947, 425),
    const Offset(1948, 100),
  ],
  [
    const Offset(1972, 116),
    const Offset(1974, 460),
    const Offset(2341, 438),
    const Offset(2301, 95),
  ],
  [
    const Offset(1332, 1203),
    const Offset(1378, 1503),
    const Offset(1668, 1432),
    const Offset(1605, 1216),
  ],
  [
    const Offset(1378, 848),
    const Offset(1322, 1159),
    const Offset(1604, 1167),
    const Offset(1636, 916),
  ],
  [
    const Offset(2441, 932),
    const Offset(2444, 1402),
    const Offset(2748, 1396),
    const Offset(2732, 908),
  ]
];

List<String> damageParts = [
  AppLocalizations.current.roof,
  AppLocalizations.current.rearBumperRight,
  AppLocalizations.current.rearBumperCenter,
  AppLocalizations.current.rearBumperLeft,
  AppLocalizations.current.frontBumperRight,
  AppLocalizations.current.frontBumperCenter,
  AppLocalizations.current.frontBumperLeft,
  AppLocalizations.current.hood,
  AppLocalizations.current.wheelFrontLeft,
  AppLocalizations.current.wheelFrontRight,
  AppLocalizations.current.wheelRearLeft,
  AppLocalizations.current.wheelRearRight,
  AppLocalizations.current.doorFrontLeft,
  AppLocalizations.current.doorReaerLeft,
  AppLocalizations.current.doorFrontRight,
  AppLocalizations.current.doorReaerRight,
  AppLocalizations.current.windscreen,
  AppLocalizations.current.frontInterior,
  AppLocalizations.current.rearInterior,
];

final List<Path> polygonRegions = vehiclePartPoints.map((final e) {
  final p = Path();
  p.addPolygon(e, true);
  return p;
}).toList();
final List<Color> colors =
    List.generate(vehiclePartPoints.length, (final index) => const Color.fromRGBO(50, 50, 200, 0));
