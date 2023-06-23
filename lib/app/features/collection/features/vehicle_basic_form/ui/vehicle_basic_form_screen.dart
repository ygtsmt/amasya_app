import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:intl/intl.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_basic_form/bloc/vehicle_basic_form_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_basic_form/data/models/models.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/models.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/utils.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleBasicDetailsScreen extends StatefulWidget {
  const VehicleBasicDetailsScreen({super.key, this.vehicle, this.vin, this.typeCertification, this.notes});
  final VehicleLongDto? vehicle;
  final String? vin;
  final String? typeCertification;
  final String? notes;
  bool get isEditMode => vehicle != null;

  @override
  State<VehicleBasicDetailsScreen> createState() => _VehicleBasicDetailsForm();
}

class _VehicleBasicDetailsForm extends State<VehicleBasicDetailsScreen> {
  bool? isNew;
  int? colorId;
  int? brandId;
  int? modelId;
  int? fuelTypeId;

  late final TextEditingController _vinNumberController;
  late final TextEditingController _typeCertificationController;
  late final TextEditingController _mileageController;
  late final TextEditingController _marketDateController;
  late final TextEditingController _internalNumberController;
  late final TextEditingController _noteController;

  @override
  void initState() {
    super.initState();

    getIt<VehicleBasicFormBloc>().add(GetBrandsEvent());
    getIt<VehicleBasicFormBloc>().add(GetColorsEvent());
    getIt<VehicleBasicFormBloc>().add(GetFuelTypesEvent());

    _vinNumberController = TextEditingController(text: widget.vehicle?.vin ?? widget.vin);
    _typeCertificationController =
        TextEditingController(text: widget.vehicle?.typeCertification ?? widget.typeCertification);
    _noteController = TextEditingController(text: widget.vehicle?.notes ?? widget.notes);
    _mileageController = TextEditingController(text: widget.vehicle?.mileage.toString() ?? "");
    _marketDateController = TextEditingController(
      text: widget.vehicle?.marketDate != null ? DateFormat("dd/MM/yyyy").format(widget.vehicle!.marketDate!) : "",
    );
    _internalNumberController = TextEditingController(text: widget.vehicle?.internalNumber ?? "");

    if (widget.isEditMode) {
      getIt<VehicleBasicFormBloc>().add(GetModelsEvent(brandId: widget.vehicle!.vehicleBrandId));
      setState(() {
        isNew = widget.vehicle?.isNew;
        colorId = widget.vehicle?.vehicleColorId;
        brandId = widget.vehicle?.vehicleBrandId;
        modelId = widget.vehicle?.vehicleModelId;
        fuelTypeId = widget.vehicle?.vehicleFuelTypeId;
      });
    }
  }

  @override
  void dispose() {
    _vinNumberController.dispose();
    _typeCertificationController.dispose();
    _noteController.dispose();
    _mileageController.dispose();
    _marketDateController.dispose();
    _internalNumberController.dispose();
    isNew = null;
    colorId = null;
    brandId = null;
    modelId = null;
    fuelTypeId = null;
    getIt<VehicleBasicFormBloc>().add(const GetModelsEvent(brandId: null));
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<VehicleBasicFormBloc, VehicleBasicFormState>(
      listener: (final context, final state) {
        if (state.createVehicleStatus == EventStatus.success) {
          context.router.pop();
        }

        if (state.updateVehicleStatus == EventStatus.success) {
          context.router.pop();
        }
      },
      builder: (final context, final state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RevoScreenHeader(title: AppLocalizations.of(context).vehicle_basic),
                  DropdownButtonFormField<bool>(
                    hint: Text(AppLocalizations.of(context).vehicle_type),
                    items: [
                      DropdownMenuItem(
                        value: true,
                        child: Text(AppLocalizations.of(context).new_car),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text(AppLocalizations.of(context).used_car),
                      )
                    ],
                    onChanged: (final value) {
                      setState(() {
                        isNew = value;
                      });
                    },
                    value: isNew,
                    validator: (final val) => val == null ? AppLocalizations.current.empty_error : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField<int>(
                    hint: Text(AppLocalizations.of(context).select_color),
                    items: state.colors
                        ?.map(
                          (final color) => DropdownMenuItem(
                            value: color.id,
                            child: Text(color.name),
                          ),
                        )
                        .toList(),
                    onChanged: (final value) {
                      setState(() {
                        colorId = value;
                      });
                    },
                    value: colorId,
                    validator: (final val) => val == null ? AppLocalizations.current.empty_error : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField(
                    hint: Text(AppLocalizations.of(context).select_brand),
                    value: brandId,
                    items: state.brands
                        ?.map(
                          (final brand) => DropdownMenuItem(
                            value: brand.id,
                            child: Text(brand.name),
                          ),
                        )
                        .toList(),
                    onChanged: (final value) {
                      setState(
                        () {
                          brandId = value;
                          modelId = null;
                        },
                      );
                      getIt<VehicleBasicFormBloc>().add(GetModelsEvent(brandId: value));
                    },
                    validator: (final val) => val == null ? AppLocalizations.current.empty_error : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField(
                    hint: Text(AppLocalizations.of(context).select_model),
                    value: state.models == null ? null : modelId,
                    items: state.models
                        ?.map(
                          (final model) => DropdownMenuItem(
                            value: model.id,
                            child: Text(model.name),
                          ),
                        )
                        .toList(),
                    onChanged: (final value) {
                      setState(() {
                        modelId = value;
                      });
                    },
                    validator: (final val) => val == null ? AppLocalizations.current.empty_error : null,
                  ),
                  TextFormField(
                    controller: _vinNumberController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).vin_number,
                    ),
                    validator: MultiValidator(
                      [
                        LengthRangeValidator(
                          min: 0,
                          max: 17,
                          errorText: AppLocalizations.of(context).form_field_invalid_error,
                        )
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _typeCertificationController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).type_certification,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _mileageController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(labelText: AppLocalizations.of(context).mileage),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _marketDateController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).date_mask_hint_text,
                      labelText: AppLocalizations.maybeOf(context)?.market_date,
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [DateTextMaskFormatter.maskFormatterDate],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _internalNumberController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).internal_number,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField(
                    hint: Text(AppLocalizations.of(context).select_fuel_type),
                    items: state.fuelTypes
                        ?.map(
                          (final fuel) => DropdownMenuItem(
                            value: fuel.id,
                            child: Text(fuel.name),
                          ),
                        )
                        .toList(),
                    onChanged: (final value) {
                      fuelTypeId = value;
                    },
                    value: fuelTypeId,
                  ),
                  TextFormField(
                    controller: _noteController,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    decoration: InputDecoration(labelText: AppLocalizations.of(context).note),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final df = DateFormat("dd/MM/yyyy");
                          final marketDate =
                              _marketDateController.text.isEmpty ? null : df.parseUTC(_marketDateController.text);

                          if (widget.isEditMode) {
                            final vehicle = widget.vehicle!.copyWith(
                              isNew: isNew,
                              vin: _vinNumberController.text.trim(),
                              vehicleColorId: colorId,
                              vehicleModelId: modelId,
                              typeCertification: _typeCertificationController.text.trim(),
                              notes: _noteController.text.trim(),
                              mileage: int.tryParse(_mileageController.text) ?? 0,
                              marketDate: marketDate,
                              internalNumber: _internalNumberController.text.trim(),
                              vehicleFuelTypeId: fuelTypeId,
                            );

                            getIt<VehicleBasicFormBloc>().add(
                              UpdateVehicleEvent(
                                vehicle: vehicle,
                              ),
                            );
                          } else {
                            getIt<VehicleBasicFormBloc>().add(
                              CreateVehicleEvent(
                                request: VehicleCreateRequest(
                                  isNew: isNew!,
                                  vin: _vinNumberController.text.trim(),
                                  vehicleColorId: colorId!,
                                  vehicleModelId: modelId!,
                                  typeCertification: _typeCertificationController.text.trim(),
                                  notes: _noteController.text.trim(),
                                  mileage: int.tryParse(_mileageController.text) ?? 0,
                                  marketDate: marketDate,
                                  internalNumber: _internalNumberController.text.trim(),
                                  vehicleFuelTypeId: fuelTypeId,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context).submit_button.toUpperCase(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
