import "dart:convert";

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:intl/intl.dart";
import "package:revogarageapp/app/data/models/photo_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/bloc/customer_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/bloc/customer_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_form/bloc/drive_form_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/services/image_picker_service.dart";
import "package:revogarageapp/core/utils.dart";
import "package:revogarageapp/generated/l10n.dart";

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key, this.customer, this.name, this.surname, this.birthDate, this.licenceNumber});

  final CustomerDto? customer;
  final String? name;
  final String? surname;
  final String? birthDate;
  final String? licenceNumber;
  bool get isEditMode => customer != null;

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _drivingLicenceNumberController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _emailController;

  bool _isCheckedSms = false;
  bool _isCheckedEmail = false;
  PhotoDto? profilePhoto;

  @override
  void initState() {
    super.initState();
    _isCheckedSms = widget.customer?.acceptSms ?? false;
    _isCheckedEmail = widget.customer?.acceptEmail ?? false;
    _firstNameController = TextEditingController(text: widget.customer?.name ?? widget.name);
    _lastNameController = TextEditingController(text: widget.customer?.surname ?? widget.surname);
    _birthDateController = TextEditingController(
      text: widget.customer?.birthDate != null
          ? DateFormat("dd/MM/yyyy").format(widget.customer!.birthDate!)
          : widget.birthDate,
    );
    _drivingLicenceNumberController =
        TextEditingController(text: widget.customer?.licenceNumber ?? widget.licenceNumber);
    _phoneNumberController = TextEditingController(text: widget.customer?.phoneNumber);
    _emailController = TextEditingController(text: widget.customer?.email);
    _addressController = TextEditingController(text: widget.customer?.address);

    if (widget.customer?.profilePhotoBase64 != null) {
      profilePhoto = PhotoDto(widget.customer!.profilePhotoBase64!, widget.customer!.profilePhotoName!);
    }

    setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<CustomerFormBloc, CustomerFormState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          getIt<CustomerListBloc>().add(GetCustomerListEvent());
          getIt<DriveFormBloc>().add(GetCustomersEvent());
          context.router.pop();
        }
      },
      builder: (final context, final state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  RevoScreenHeader(
                    title: widget.isEditMode == true
                        ? AppLocalizations.of(context).edit_customer
                        : AppLocalizations.of(context).create_customer,
                  ),
                  GestureDetector(
                    onTap: () {
                      final imagePickerService = getIt<ImagePickerService>();
                      imagePickerService.takePhoto().then((final file) async {
                        if (file != null) {
                          profilePhoto = await imagePickerService.filetoBase64(file);
                          setState(() {});
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 50,
                      child: profilePhoto != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.memory(
                                gaplessPlayback: true,
                                base64Decode(profilePhoto!.base64),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(
                              Icons.camera_alt,
                              size: 50,
                            ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                controller: _firstNameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context).first_name,
                                  prefixIcon: const Icon(Icons.person_outline),
                                ),
                                validator: RequiredValidator(
                                  errorText: AppLocalizations.current.empty_error,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _lastNameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person_outline),
                                  labelText: AppLocalizations.of(context).last_name,
                                ),
                                validator: RequiredValidator(
                                  errorText: AppLocalizations.current.empty_error,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _birthDateController,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).date_mask_hint_text,
                            prefixIcon: const Icon(Icons.date_range_outlined),
                            labelText: AppLocalizations.of(context).birthDate,
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          inputFormatters: [DateTextMaskFormatter.maskFormatterDate],
                        ),
                        TextFormField(
                          controller: _drivingLicenceNumberController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.onetwothree_outlined),
                            labelText: AppLocalizations.of(context).drivingLicenceNumber,
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.abc),
                            labelText: AppLocalizations.of(context).address,
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _phoneNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).phone_number,
                            hintText: AppLocalizations.of(context).phone_number_mask_hint_text,
                            prefixIcon: const Icon(Icons.phone_outlined),
                          ),
                          validator: (final String? value) {
                            return value!.isNotEmpty && value.length < 14
                                ? AppLocalizations.current.phone_number_error
                                : null;
                          },
                          inputFormatters: [PhoneTextMaskFormatter.maskFormatter],
                        ),
                        TextFormField(
                          controller: _emailController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).email,
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          validator: MultiValidator(
                            [
                              EmailValidator(
                                errorText: AppLocalizations.current.email_error,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isCheckedSms,
                              onChanged: (final bool? value) {
                                setState(() {
                                  _isCheckedSms = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context).theClientAcceptsReceivingSmsMessages,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isCheckedEmail,
                              onChanged: (final bool? value) {
                                setState(() {
                                  _isCheckedEmail = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context).theClientAcceptsReceivingEmailMessages,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: FilledButton(
                              onPressed: state.status == EventStatus.processing
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        final df = DateFormat("dd/MM/yyyy");
                                        final birthDate = _birthDateController.text.isNotEmpty
                                            ? df.parseUTC(_birthDateController.text)
                                            : null;
                                        if (widget.isEditMode) {
                                          getIt<CustomerFormBloc>().add(
                                            UpdateCustomerEvent(
                                              CustomerDto(
                                                id: widget.customer!.id,
                                                name: _firstNameController.text.trim(),
                                                surname: _lastNameController.text.trim(),
                                                birthDate: birthDate,
                                                email: _emailController.text.trim(),
                                                phoneNumber: _phoneNumberController.text.trim(),
                                                address: _addressController.text.trim(),
                                                licenceNumber: _drivingLicenceNumberController.text.trim(),
                                                acceptSms: _isCheckedSms,
                                                acceptEmail: _isCheckedEmail,
                                                profilePhotoBase64: profilePhoto?.base64,
                                                profilePhotoName: profilePhoto?.name,
                                              ),
                                            ),
                                          );
                                        } else {
                                          getIt<CustomerFormBloc>().add(
                                            CreateCustomerEvent(
                                              CustomerDto(
                                                id: 0,
                                                name: _firstNameController.text.trim(),
                                                surname: _lastNameController.text.trim(),
                                                birthDate: birthDate,
                                                email: _emailController.text.trim(),
                                                phoneNumber: _phoneNumberController.text.trim(),
                                                address: _addressController.text.trim(),
                                                licenceNumber: _drivingLicenceNumberController.text.trim(),
                                                acceptSms: _isCheckedSms,
                                                acceptEmail: _isCheckedEmail,
                                                profilePhotoBase64: profilePhoto?.base64,
                                                profilePhotoName: profilePhoto?.name,
                                              ),
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
                        ),
                        if (widget.isEditMode)
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () {
                                  getIt<CustomerFormBloc>().add(DeleteCustomerEvent(customerId: widget.customer!.id));
                                },
                                label: Text(
                                  AppLocalizations.of(context).delete.toUpperCase(),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showSnackBarOnlyNumberPictureAllowed() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).you_cannot_upload_more_than_three_photos)));
  }

  void showSnackBarUnsupportedFileType() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).file_type_is_not_supported)));
  }

  Future<dynamic> addPhotoDialog(
    final BuildContext context,
    final VoidCallback takePhotoFunction,
    final VoidCallback uploadPhotoFunction,
  ) {
    return showDialog(
      context: context,
      builder: (final context) => SimpleDialog(
        title: Text(
          AppLocalizations.of(context).add_photo,
          textAlign: TextAlign.center,
        ),
        children: [
          TextButton.icon(
            label: Text(
              AppLocalizations.of(context).take_photo,
            ),
            onPressed: () {
              takePhotoFunction();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          TextButton.icon(
            label: Text(
              AppLocalizations.of(context).choose_from_gallery,
            ),
            onPressed: () {
              uploadPhotoFunction();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.add_photo_alternate_outlined),
          ),
        ],
      ),
    );
  }
}
 /*  Row(
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    addPhotoDialog(
                                      context,
                                      takePhoto,
                                      () => multiImagePicker(isMultiImagePicker: true),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add_photo_alternate_outlined,
                                  ),
                                  label: Text(
                                    AppLocalizations.of(context).add_additional_photos,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ), */
                        /*     if (multiImages.isNotEmpty)
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 1,
                            ),
                            itemCount: multiImages.length,
                            itemBuilder: (final BuildContext context, final int index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      FullScreenWidget(
                                        disposeLevel: DisposeLevel.High,
                                        child: Image.file(
                                          File(multiImages[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        right: -4,
                                        bottom: -4,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              multiImages.removeAt(index);
                                            });
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ), */
                            /*  debugPrint(
                                            _firstNameController.text.trim(),
                                          );
                                          debugPrint(
                                            _lastNameController.text.trim(),
                                          );
                                          debugPrint(DateTime.parse(_birthDateController.text).toString());
                                          debugPrint(
                                            _emailController.text.trim(),
                                          );
                                          debugPrint(
                                            _phoneNumberController.text.trim(),
                                          );
                                          debugPrint(_addressController.text.trim());
                                          debugPrint(
                                            _drivingLicenceNumberController.text.trim(),
                                          );
                                          debugPrint(_isCheckedSms.toString());
                                          debugPrint(_isCheckedEmail.toString());
                                          debugPrint(selectedProfileImageName);
                                          debugPrint(base64Image); */
