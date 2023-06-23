import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_form/bloc/sms_template_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/bloc/sms_template_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/data/models/sms_template_list_short_dto.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class SmsTemplateFormScreen extends StatefulWidget {
  const SmsTemplateFormScreen({
    super.key,
    this.smsTemplate,
  });

  final SmsTemplateListShortDto? smsTemplate;

  bool get isEditMode => smsTemplate != null;

  @override
  State<SmsTemplateFormScreen> createState() => _SmsTemplateFormScreenState();
}

class _SmsTemplateFormScreenState extends State<SmsTemplateFormScreen> {
  late final TextEditingController _smsTemplateNameController;
  late final TextEditingController _smsTemplateTextController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _smsTemplateNameController = TextEditingController(text: widget.smsTemplate?.name);
    _smsTemplateTextController = TextEditingController(text: widget.smsTemplate?.text);
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<SmsTemplateFormBloc, SmsTemplateFormState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          getIt<SmsTemplateListBloc>().add(GetSmsTemplateListEvent());
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
                    title: widget.isEditMode
                        ? AppLocalizations.of(context).edit_template
                        : AppLocalizations.of(context).create_sms_template,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _smsTemplateNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).template_name,
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
                          controller: _smsTemplateTextController,
                          maxLines: null,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).sms_text,
                            prefixIcon: const Icon(Icons.sms_outlined),
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
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: state.status == EventStatus.processing
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.isEditMode) {
                              getIt<SmsTemplateFormBloc>().add(
                                UpdateSmsTemplateEvent(
                                  SmsTemplateListShortDto(
                                    id: widget.smsTemplate!.id,
                                    name: _smsTemplateNameController.text.trim(),
                                    text: _smsTemplateTextController.text.trim(),
                                    garageId: widget.smsTemplate!.garageId,
                                  ),
                                ),
                              );
                            } else {
                              getIt<SmsTemplateFormBloc>().add(
                                CreateSmsTemplateEvent(
                                  smsTemplateName: _smsTemplateNameController.text.trim(),
                                  smsTemplateText: _smsTemplateTextController.text.trim(),
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
                      : Text(
                          AppLocalizations.of(context).save.toUpperCase(),
                        ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.router.push(
                        SendShortSmsScreenRoute(
                          smsTemplateText: _smsTemplateTextController.text,
                        ),
                      );
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context).use_this_template,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (widget.isEditMode)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<SmsTemplateFormBloc>().add(DeleteSmsTemplateEvent(widget.smsTemplate!.id));
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
