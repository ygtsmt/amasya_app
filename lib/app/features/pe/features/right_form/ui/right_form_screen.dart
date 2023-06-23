import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/features/pe/features/right_form/bloc/right_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_list/bloc/right_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/models/right_list_short_dto.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class RightScreen extends StatefulWidget {
  const RightScreen({super.key, this.right});

  final RightListShortDto? right;
  bool get isEditMode => right != null;

  @override
  State<RightScreen> createState() => _RightScreenState();
}

class _RightScreenState extends State<RightScreen> {
  late final TextEditingController _rightNameController;
  late final TextEditingController _rightDescriptionController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _rightNameController = TextEditingController(text: widget.right?.name);
    _rightDescriptionController = TextEditingController(text: widget.right?.text);
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<RightFormBloc, RightFormState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          getIt<RightListBloc>().add(GetRightListEvent());
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
                        ? AppLocalizations.of(context).edit_right
                        : AppLocalizations.of(context).createRight,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _rightNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).rightName,
                            prefixIcon: const Icon(Icons.abc),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: AppLocalizations.current.empty_error,
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _rightDescriptionController,
                          maxLines: null,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).rightDescription,
                            prefixIcon: const Icon(Icons.description_outlined),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: AppLocalizations.current.empty_error,
                              ),
                            ],
                          ),
                        ),
                      ],
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
                              if (widget.isEditMode) {
                                getIt<RightFormBloc>().add(
                                  UpdateRightEvent(
                                    RightListShortDto(
                                      id: widget.right!.id,
                                      name: _rightNameController.text.trim(),
                                      text: _rightDescriptionController.text.trim(),
                                      garageId: widget.right!.garageId,
                                    ),
                                  ),
                                );
                              } else {
                                getIt<RightFormBloc>().add(
                                  CreateRightEvent(
                                    name: _rightNameController.text.trim(),
                                    text: _rightDescriptionController.text.trim(),
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
              const SizedBox(height: 8),
              if (widget.isEditMode)
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        getIt<RightFormBloc>().add(DeleteRightEvent(rightId: widget.right!.id));
                      },
                      label: Text(
                        AppLocalizations.of(context).delete.toUpperCase(),
                      ),
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
