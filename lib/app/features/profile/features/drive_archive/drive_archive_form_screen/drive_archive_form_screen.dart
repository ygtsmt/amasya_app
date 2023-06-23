// ignore_for_file: public_member_api_docs, sort_constructors_first

import "dart:convert";

import "package:currency_text_input_formatter/currency_text_input_formatter.dart";
import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_datetime_picker/flutter_datetime_picker.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:group_button/group_button.dart";
import "package:intl/intl.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_form/bloc/drive_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/bloc/drive_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/models/drive_dto.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/generated/l10n.dart";
import "package:signature/signature.dart";

class DriveArchiveFormScreen extends StatefulWidget {
  const DriveArchiveFormScreen({this.drive, super.key});

  final DriveDto? drive;

  bool get isEditMode => drive != null;

  @override
  State<DriveArchiveFormScreen> createState() => _DriveArchiveFormScreenState();
}

class _DriveArchiveFormScreenState extends State<DriveArchiveFormScreen> {
  int? customerId;
  int? licencePlateId;
  int? vehicleId;
  int? rightId;
  List<PlatformFile> fileNames = [];

  final SignatureController _signatureController = SignatureController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final GroupButtonController _carTypeGroupButtonController;
  late final TextEditingController _handOverKmController;
  late final TextEditingController _handOverLiterController;
  late final TextEditingController _priceController;
  late final TextEditingController _durationController;
  late final TextEditingController _durationKmController;
  late final TextEditingController _drivesNoteController;
  late final TextEditingController _returnKmController;
  late final TextEditingController _returnLiterController;
  late final TextEditingController _handOverDateController;
  late final TextEditingController _returnDateController;
  int? deneme;
  @override
  void initState() {
    super.initState();

    getIt<DriveFormBloc>().add(GetCustomersEvent());
    getIt<DriveFormBloc>().add(GetLicencePlatesEvent());
    getIt<DriveFormBloc>().add(GetVehiclesEvent());
    getIt<DriveFormBloc>().add(GetRightsEvent());

    customerId = widget.drive?.customerId;
    licencePlateId = widget.drive?.licencePlateId;
    vehicleId = widget.drive?.vehicleId;
    rightId = widget.drive?.rightId;

    _carTypeGroupButtonController = GroupButtonController();
    _carTypeGroupButtonController.selectIndex(widget.drive?.carType == DriveCarType.test ? 0 : 1);
    deneme = _carTypeGroupButtonController.selectedIndex;
    _handOverKmController = TextEditingController(text: widget.drive?.handoverKm.toString());
    _handOverLiterController = TextEditingController(text: widget.drive?.handoverFuel.toString());
    _drivesNoteController = TextEditingController(text: widget.drive?.note);
    _priceController = TextEditingController(text: widget.drive?.price.toString());
    _durationController = TextEditingController(text: widget.drive?.duration);
    _durationKmController = TextEditingController(text: widget.drive?.durationKm.toString());
    _returnKmController = TextEditingController(text: widget.drive?.returnKm.toString());
    _returnLiterController = TextEditingController(text: widget.drive?.returnFuel.toString());
    _handOverDateController = TextEditingController(
      text: widget.drive?.handoverDate != null ? DateFormat.yMd().add_jm().format(widget.drive!.handoverDate) : "",
    );
    _returnDateController = TextEditingController(
      text: widget.drive?.returnDate != null ? DateFormat.yMd().add_jm().format(widget.drive!.returnDate!) : "",
    );

    setState(() {});
  }

  Future<void> pickFiles() async {
    final FilePickerResult? filePickResult = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (filePickResult != null) {
      setState(() {
        fileNames = filePickResult.files;
      });
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<DriveFormBloc, DriveFormState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          getIt<DriveListBloc>().add(GetDriveListEvent());
          Navigator.of(context).pop();
        }
      },
      builder: (final context, final state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                RevoScreenHeader(
                  title: AppLocalizations.of(context).drive_archive_form,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context).carType,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    GroupButton(
                      controller: _carTypeGroupButtonController,
                      buttons: [AppLocalizations.of(context).test, AppLocalizations.of(context).replacement],
                      options: GroupButtonOptions(
                        groupingType: GroupingType.row,
                        mainGroupAlignment: MainGroupAlignment.spaceBetween,
                        unselectedColor: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      onSelected: (final String value, final int index, final bool isSelected) {
                        _carTypeGroupButtonController.selectIndex(deneme!);
                      },
                    ),
                  ],
                ),

                DropdownButtonFormField<int>(
                  hint: Text(AppLocalizations.of(context).customers),
                  value: state.customers.isNotEmpty ? customerId : null,
                  items: state.customers
                      .map(
                        (final customer) => DropdownMenuItem(
                          value: customer.id,
                          enabled: false,
                          child: Text("${customer.name} ${customer.surname}"),
                        ),
                      )
                      .toList(),
                  onChanged: null,
                  validator: (final value) => value == null ? AppLocalizations.current.empty_error : null,
                ),
                DropdownButtonFormField<int>(
                  value: state.licencePlates.isNotEmpty ? licencePlateId : null,
                  hint: Text(AppLocalizations.of(context).licence_plates),
                  items: state.licencePlates
                      .map(
                        (final licencePlate) => DropdownMenuItem(
                          value: licencePlate.id,
                          enabled: false,
                          child: Text(licencePlate.plate),
                        ),
                      )
                      .toList(),
                  onChanged: null,
                  validator: (final value) => value == null ? AppLocalizations.current.empty_error : null,
                ),
                DropdownButtonFormField<int>(
                  value: state.vehicles.isNotEmpty ? vehicleId : null,
                  hint: Text(AppLocalizations.of(context).vehicles),
                  items: state.vehicles
                      .map(
                        (final vehicle) => DropdownMenuItem(
                          value: vehicle.id,
                          enabled: false,
                          child: Text("${vehicle.vehicleBrandName} ${vehicle.vehicleModelName}"),
                        ),
                      )
                      .toList(),
                  onChanged: null,
                  validator: (final value) => value == null ? AppLocalizations.current.empty_error : null,
                ),
                DropdownButtonFormField(
                  value: state.rights.isNotEmpty ? rightId : null,
                  hint: Text(AppLocalizations.of(context).rights),
                  items: state.rights
                      .map(
                        (final right) => DropdownMenuItem(
                          value: right.id,
                          enabled: false,
                          child: Text(right.name),
                        ),
                      )
                      .toList(),
                  onChanged: null,
                  validator: (final value) => value == null ? AppLocalizations.current.empty_error : null,
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: _handOverDateController,
                  readOnly: true,
                  enabled: false,
                  onTap: () {
                    final handoverDate = _handOverDateController.text.isEmpty
                        ? null
                        : DateFormat.yMd().add_jm().parse(_handOverDateController.text);

                    DatePicker.showDateTimePicker(
                      context,
                      onConfirm: (final date) {
                        _handOverDateController.text = DateFormat.yMd().add_jm().format(date);
                      },
                      currentTime: handoverDate,
                    );
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).handover_date,
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: AppLocalizations.current.empty_error),
                  ]),
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        controller: _handOverKmController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).handover_km,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: AppLocalizations.current.empty_error),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        controller: _handOverLiterController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).handover_liter,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: AppLocalizations.current.empty_error),
                        ]),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  enabled: false,
                  controller: _priceController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).price,
                    suffixText: AppLocalizations.of(context).chf,
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      decimalDigits: 0,
                      symbol: "",
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        controller: _durationKmController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).duratin_km,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        controller: _durationController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).duration,
                        ),
                      ),
                    ),
                  ],
                ),

                TextFormField(
                  enabled: false,
                  controller: _returnDateController,
                  readOnly: true,
                  onTap: () {
                    final returnDate = _returnDateController.text.isEmpty
                        ? null
                        : DateFormat.yMd().add_jm().parse(_returnDateController.text);

                    DatePicker.showDateTimePicker(
                      context,
                      onConfirm: (final date) {
                        _returnDateController.text = DateFormat.yMd().add_jm().format(date);
                      },
                      currentTime: returnDate,
                    );
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).return_date,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        enabled: false,

                        controller: _returnKmController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).return_km,
                        ),
                        // validator: MultiValidator([
                        //   RequiredValidator(errorText: AppLocalizations.current.empty_error),
                        // ]),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        enabled: false,

                        controller: _returnLiterController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).return_liter,
                        ),
                        // validator: MultiValidator([
                        //   RequiredValidator(errorText: AppLocalizations.current.empty_error),
                        // ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12),
                            child: Text(
                              AppLocalizations.of(context).signature,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          if (!widget.isEditMode)
                            IconButton(
                              icon: const Icon(Icons.clear_all_outlined),
                              onPressed: () {
                                _signatureController.clear();
                              },
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (widget.isEditMode && widget.drive?.signatureBase64 != null)
                        Image.memory(
                          base64Decode(widget.drive!.signatureBase64),
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      else
                        Signature(
                          controller: _signatureController,
                          width: double.infinity,
                          height: 120,
                          backgroundColor: Colors.transparent,
                        ),
                    ],
                  ),
                ),
                TextFormField(
                  enabled: false,
                  controller: _drivesNoteController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: AppLocalizations.of(context).note),
                ),
                const SizedBox(
                  height: 14,
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: fileNames.length,
                //   itemBuilder: (final context, final index) {
                //     return Card(
                //       child: ListTile(
                //         title: Text(fileNames[index].name),
                //         trailing: IconButton(
                //           onPressed: () {
                //             setState(() {
                //               fileNames.removeAt(index);
                //             });
                //           },
                //           icon: const Icon(Icons.delete),
                //         ),
                //       ),
                //     );
                //   },
                // ),

                const SizedBox(
                  height: 12,
                ),

                if (widget.isEditMode)
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.tonal(
                      onPressed: () {
                        getIt<DriveFormBloc>().add(SendDrivePdfEvent(widget.drive!.id));
                      },
                      child: Text(AppLocalizations.of(context).send_pdf),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
