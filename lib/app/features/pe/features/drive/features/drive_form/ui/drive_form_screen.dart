// ignore_for_file: public_member_api_docs, sort_constructors_first

import "dart:convert";

import "package:collection/collection.dart";
import "package:currency_text_input_formatter/currency_text_input_formatter.dart";
import "package:dropdown_search/dropdown_search.dart";
import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_datetime_picker/flutter_datetime_picker.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:group_button/group_button.dart";
import "package:intl/intl.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/ui/customer_form_screen.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_form/bloc/drive_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/bloc/drive_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/models/drive_dto.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_form/ui/licence_plate_form_screen.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/models/licence_plate_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/models/right_list_short_dto.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/generated/l10n.dart";
import "package:signature/signature.dart";

class DriveFormScreen extends StatefulWidget {
  const DriveFormScreen({this.drive, super.key});

  final DriveDto? drive;

  bool get isEditMode => drive != null;

  @override
  State<DriveFormScreen> createState() => _DriveFormScreenState();
}

class _DriveFormScreenState extends State<DriveFormScreen> {
  // int? customerId;
  CustomerDto? customer;
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

  @override
  void initState() {
    super.initState();

    getIt<DriveFormBloc>().add(GetCustomersEvent());
    getIt<DriveFormBloc>().add(GetLicencePlatesEvent());
    getIt<DriveFormBloc>().add(GetVehiclesEvent());
    getIt<DriveFormBloc>().add(GetRightsEvent());

    // customerId = widget.drive?.customerId;
    customer = getIt<DriveFormBloc>().state.customers.firstWhereOrNull((final c) => c.id == widget.drive?.customerId);
    licencePlateId = widget.drive?.licencePlateId;
    vehicleId = widget.drive?.vehicleId;
    rightId = widget.drive?.rightId;

    _carTypeGroupButtonController = GroupButtonController();
    _carTypeGroupButtonController.selectIndex(widget.drive?.carType == DriveCarType.test ? 0 : 1);
    _handOverKmController =
        TextEditingController(text: widget.drive?.handoverKm == null ? "" : widget.drive!.handoverKm.toString());
    _handOverLiterController =
        TextEditingController(text: widget.drive?.handoverFuel == null ? "" : widget.drive!.handoverFuel.toString());
    _drivesNoteController = TextEditingController(text: widget.drive?.note ?? "");
    _priceController = TextEditingController(text: widget.drive?.price == null ? "" : widget.drive!.price.toString());
    _durationController = TextEditingController(text: widget.drive?.duration ?? "");
    _durationKmController =
        TextEditingController(text: widget.drive?.durationKm == null ? "" : widget.drive!.durationKm.toString());
    _returnKmController =
        TextEditingController(text: widget.drive?.returnKm == null ? "" : widget.drive!.returnKm.toString());
    _returnLiterController =
        TextEditingController(text: widget.drive?.returnFuel == null ? "" : widget.drive!.returnFuel.toString());
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
        final activeDriveVehicleIds =
            getIt<DriveListBloc>().state.drives?.map((final drive) => drive.vehicleId).toList() ?? [];

        if (widget.isEditMode) {
          activeDriveVehicleIds.remove(widget.drive?.vehicleId);
        }

        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                RevoScreenHeader(
                  title: widget.isEditMode == true
                      ? AppLocalizations.of(context).edit_drive_form
                      : AppLocalizations.of(context).create_drive_form,
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
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownSearch<CustomerDto>(
                        itemAsString: (final item) => "${item.name} ${item.surname}",
                        items: state.customers,
                        onChanged: (final value) {
                          setState(() {
                            customer = value;
                          });
                        },
                        selectedItem: customer,
                        filterFn: (final item, final filter) {
                          return item.name.toLowerCase().contains(filter.toLowerCase()) ||
                              item.surname.toLowerCase().contains(filter.toLowerCase());
                        },
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: AppLocalizations.of(context).customers,
                          ),
                        ),
                        popupProps: PopupPropsMultiSelection.bottomSheet(
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).search,
                              prefixIcon: const Icon(Icons.search),
                            ),
                          ),
                          showSearchBox: true,
                        ),
                        validator: (final value) => value == null ? AppLocalizations.current.empty_error : null,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        getIt<BottomSheetService>().show(
                          context,
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: const CustomerScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownSearch<LicencePlateShortDto>(
                        itemAsString: (final item) => item.plate,
                        items: state.licencePlates,
                        onChanged: (final value) {
                          setState(() {
                            licencePlateId = value!.id;
                          });
                        },
                        filterFn: (final item, final filter) {
                          return item.plate.toLowerCase().contains(filter.toLowerCase());
                        },
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: AppLocalizations.of(context).licence_plates,
                          ),
                        ),
                        popupProps: PopupPropsMultiSelection.bottomSheet(
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).search,
                              prefixIcon: const Icon(Icons.search),
                            ),
                          ),
                          showSearchBox: true,
                        ),
                        validator: (final value) => value == null ? AppLocalizations.current.empty_error : null,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        getIt<BottomSheetService>()
                            .show(
                          context,
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: const LicencePlateFormScreen(),
                          ),
                        )
                            .then((final value) {
                          getIt<DriveFormBloc>().add(GetLicencePlatesEvent());
                        });
                      },
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: DropdownSearch<VehicleShortDto>(
                        itemAsString: (final item) => "${item.vehicleBrandName} ${item.vehicleModelName}",
                        items: state.vehicles,
                        onChanged: (final value) {
                          setState(() {
                            vehicleId = value!.id;
                          });
                        },
                        filterFn: (final item, final filter) {
                          return item.vehicleBrandName.toLowerCase().contains(filter.toLowerCase()) ||
                              item.vehicleModelName.toLowerCase().contains(filter.toLowerCase());
                        },
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: AppLocalizations.of(context).pande_vehicles,
                          ),
                        ),
                        popupProps: PopupPropsMultiSelection.bottomSheet(
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).search,
                              prefixIcon: const Icon(Icons.search),
                            ),
                          ),
                          showSearchBox: true,
                        ),
                        validator: (final value) => value == null ? AppLocalizations.current.empty_error : null,
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     getIt<BottomSheetService>().show(
                    //       context,
                    //       Container(
                    //         padding: const EdgeInsets.all(16),
                    //         child: const VehicleBasicDetailsScreen(),
                    //       ),
                    //     );
                    //   },
                    //   icon: const Icon(Icons.add),
                    // )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownSearch<RightListShortDto>(
                        itemAsString: (final item) => item.name,
                        items: state.rights,
                        onChanged: (final value) {
                          setState(() {
                            rightId = value!.id;
                          });
                        },
                        filterFn: (final item, final filter) {
                          return item.name.toLowerCase().contains(filter.toLowerCase());
                        },
                        validator: (final value) {
                          return null;
                        },
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: AppLocalizations.of(context).rights,
                          ),
                        ),
                        popupProps: PopupPropsMultiSelection.bottomSheet(
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).search,
                              prefixIcon: const Icon(Icons.search),
                            ),
                          ),
                          showSearchBox: true,
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     getIt<BottomSheetService>().show(
                    //       context,
                    //       Container(
                    //         padding: const EdgeInsets.all(16),
                    //         child: const VehicleBasicDetailsScreen(),
                    //       ),
                    //     );
                    //   },
                    //   icon: const Icon(Icons.add),
                    // )
                  ],
                ),

                if (rightId != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        state.rights.firstWhereOrNull((final element) => element.id == rightId)?.text ?? "",
                      ),
                    ),
                  ),

                TextFormField(
                  controller: _handOverDateController,
                  readOnly: true,
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
                        controller: _handOverKmController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onChanged: (final value) {
                          setState(() {});
                        },
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
                        controller: _handOverLiterController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onChanged: (final value) {
                          setState(() {});
                        },
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _returnKmController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onChanged: (final value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).return_km,
                            ),
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: AppLocalizations.current.empty_error),
                            // ]),
                          ),
                          if (_handOverKmController.text.isNotEmpty && _returnKmController.text.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "${int.parse(_returnKmController.text) - int.parse(_handOverKmController.text)} km",
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormField(
                            controller: _returnLiterController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).return_liter,
                            ),
                            onChanged: (final value) {
                              setState(() {});
                            },
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: AppLocalizations.current.empty_error),
                            // ]),
                          ),
                          if (_handOverLiterController.text.isNotEmpty && _returnLiterController.text.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "${double.parse(_handOverLiterController.text) - double.parse(_returnLiterController.text)}",
                              ),
                            ),
                        ],
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

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () async {
                      // signatureBytes.
                      if (_carTypeGroupButtonController.selectedIndex == null) {
                        _formKey.currentState!.validate();
                        getIt<SnackBarService>().showSnackBar(AppLocalizations.current.carTypeError);
                      } else if (!widget.isEditMode && _signatureController.isEmpty) {
                        _formKey.currentState!.validate();
                        getIt<SnackBarService>().showSnackBar(AppLocalizations.current.signatureError);
                      } else if (_formKey.currentState!.validate()) {
                        final image = await _signatureController.toPngBytes();
                        final signatureEncoded =
                            widget.isEditMode ? widget.drive?.signatureBase64 : base64.encode(image!);

                        final handoverDate = _handOverDateController.text.isEmpty
                            ? null
                            : DateFormat.yMd().add_jm().parseUTC(_handOverDateController.text);

                        final returnDate = _returnDateController.text.isEmpty
                            ? null
                            : DateFormat.yMd().add_jm().parseUTC(_returnDateController.text);

                        if (widget.isEditMode) {
                          getIt<DriveFormBloc>().add(
                            UpdateDriveEvent(
                              DriveDto(
                                id: widget.drive!.id,
                                customerId: customer!.id,
                                licencePlateId: licencePlateId!,
                                status: DriveStatus.inDrive,
                                vehicleId: vehicleId!,
                                rightId: rightId,
                                handoverDate: handoverDate!,
                                returnDate: returnDate,
                                handoverKm: int.tryParse(_handOverKmController.text) ?? 0,
                                handoverFuel: int.tryParse(_handOverLiterController.text) ?? 0,
                                price: double.tryParse(_priceController.text) ?? 0,
                                duration: _durationController.text,
                                durationKm: int.tryParse(_durationKmController.text) ?? 0,
                                returnKm: int.tryParse(_returnKmController.text),
                                returnFuel: int.tryParse(_returnLiterController.text),
                                note: _drivesNoteController.text,
                                carType: _carTypeGroupButtonController.selectedIndex == 0
                                    ? DriveCarType.test
                                    : DriveCarType.replacement,
                                signatureBase64: signatureEncoded!,
                              ),
                            ),
                          );
                        } else {
                          final handoverDate = _handOverDateController.text.isEmpty
                              ? null
                              : DateFormat.yMd().add_jm().parseUTC(_handOverDateController.text);

                          final returnDate = _returnDateController.text.isEmpty
                              ? null
                              : DateFormat.yMd().add_jm().parseUTC(_returnDateController.text);

                          getIt<DriveFormBloc>().add(
                            SaveDriveEvent(
                              DriveDto(
                                customerId: customer!.id,
                                licencePlateId: licencePlateId!,
                                status: DriveStatus.inDrive,
                                vehicleId: vehicleId!,
                                rightId: rightId,
                                handoverDate: handoverDate!,
                                returnDate: returnDate,
                                handoverKm: int.tryParse(_handOverKmController.text) ?? 0,
                                handoverFuel: int.tryParse(_handOverLiterController.text) ?? 0,
                                price: double.tryParse(_priceController.text) ?? 0,
                                duration: _durationController.text,
                                durationKm: int.tryParse(_durationKmController.text) ?? 0,
                                returnKm: int.tryParse(_returnKmController.text),
                                returnFuel: int.tryParse(_returnLiterController.text),
                                note: _drivesNoteController.text,
                                carType: _carTypeGroupButtonController.selectedIndex == 0
                                    ? DriveCarType.test
                                    : DriveCarType.replacement,
                                signatureBase64: signatureEncoded!,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(AppLocalizations.of(context).save),
                  ),
                ),
                if (widget.isEditMode)
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.tonal(
                      onPressed: () async {
                        getIt<DriveFormBloc>().add(SendDrivePdfEvent(widget.drive!.id));
                      },
                      child: Text(AppLocalizations.of(context).send_pdf),
                    ),
                  ),
                if (widget.isEditMode)
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.tonal(
                      onPressed: () async {
                        if (_carTypeGroupButtonController.selectedIndex == null) {
                          _formKey.currentState!.validate();
                          getIt<SnackBarService>().showSnackBar(AppLocalizations.current.carTypeError);
                        } else if (!widget.isEditMode && _signatureController.isEmpty) {
                          _formKey.currentState!.validate();
                          getIt<SnackBarService>().showSnackBar(AppLocalizations.current.signatureError);
                        } else if (_formKey.currentState!.validate()) {
                          final image = await _signatureController.toPngBytes();
                          final signatureEncoded =
                              widget.isEditMode ? widget.drive?.signatureBase64 : base64.encode(image!);

                          final handoverDate = _handOverDateController.text.isEmpty
                              ? null
                              : DateFormat.yMd().add_jm().parseUTC(_handOverDateController.text);

                          final returnDate = _returnDateController.text.isEmpty
                              ? null
                              : DateFormat.yMd().add_jm().parseUTC(_returnDateController.text);

                          if (widget.isEditMode) {
                            getIt<DriveFormBloc>().add(
                              UpdateDriveEvent(
                                DriveDto(
                                  id: widget.drive!.id,
                                  customerId: customer!.id,
                                  licencePlateId: licencePlateId!,
                                  status: DriveStatus.inDrive,
                                  vehicleId: vehicleId!,
                                  rightId: rightId,
                                  handoverDate: handoverDate!,
                                  returnDate: returnDate,
                                  handoverKm: int.tryParse(_handOverKmController.text) ?? 0,
                                  handoverFuel: int.tryParse(_handOverLiterController.text) ?? 0,
                                  price: double.tryParse(_priceController.text) ?? 0,
                                  duration: _durationController.text,
                                  durationKm: int.tryParse(_durationKmController.text) ?? 0,
                                  returnKm: int.tryParse(_returnKmController.text),
                                  returnFuel: int.tryParse(_returnLiterController.text),
                                  note: _drivesNoteController.text,
                                  carType: _carTypeGroupButtonController.selectedIndex == 0
                                      ? DriveCarType.test
                                      : DriveCarType.replacement,
                                  signatureBase64: signatureEncoded!,
                                ),
                              ),
                            );
                            getIt<DriveFormBloc>().add(DeleteDriveEvent(widget.drive!.id));
                          }
                        }
                      },
                      child: Text(AppLocalizations.of(context).close),
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
