import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_form/bloc/bloc/licence_plate_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/bloc/licence_plate_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/models/licence_plate_short_dto.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class LicencePlateFormScreen extends StatefulWidget {
  const LicencePlateFormScreen({
    super.key,
    this.licencePlate,
  });

  final LicencePlateShortDto? licencePlate;

  bool get isEditMode => licencePlate != null;

  @override
  State<LicencePlateFormScreen> createState() => _LicencePlateFormScreenState();
}

class _LicencePlateFormScreenState extends State<LicencePlateFormScreen> {
  late final TextEditingController _plateNameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _plateNameController = TextEditingController(text: widget.licencePlate?.plate);
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<LicencePlateFormBloc, LicencePlateFormState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          getIt<LicencePlateListBloc>().add(GetLicencePlateListEvent());
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
                        ? AppLocalizations.of(context).edit_licence_plate
                        : AppLocalizations.of(context).create_licence_plates,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _plateNameController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).plateName,
                        prefixIcon: const Icon(Icons.onetwothree_outlined),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: AppLocalizations.current.empty_error,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: state.status == EventStatus.processing
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.isEditMode) {
                              getIt<LicencePlateFormBloc>().add(
                                UpdateLicencePlateEvent(
                                  LicencePlateShortDto(
                                    id: widget.licencePlate!.id,
                                    plate: _plateNameController.text.trim(),
                                    garageId: widget.licencePlate!.garageId,
                                  ),
                                ),
                              );
                            } else {
                              getIt<LicencePlateFormBloc>()
                                  .add(CreateLicencePlateEvent(licencePlate: _plateNameController.text.trim()));
                            }
                          }
                        },
                  child: state.status == EventStatus.processing
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          AppLocalizations.of(context).save.toUpperCase(),
                        ),
                ),
              ),
              const SizedBox(height: 8),
              if (widget.isEditMode)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<LicencePlateFormBloc>().add(DeleteLicencePlateEvent(widget.licencePlate!.id));
                    },
                    child: Text(
                      AppLocalizations.of(context).delete.toUpperCase(),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
