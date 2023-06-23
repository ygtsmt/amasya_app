part of "sms_template_form_bloc.dart";

abstract class SmsTemplateFormEvent extends Equatable {
  const SmsTemplateFormEvent();

  @override
  List<Object> get props => [];
}

class CreateSmsTemplateEvent extends SmsTemplateFormEvent {
  const CreateSmsTemplateEvent({required this.smsTemplateName, required this.smsTemplateText});

  final String smsTemplateName;
  final String smsTemplateText;

  @override
  List<Object> get props => [smsTemplateName, smsTemplateText];
}

class UpdateSmsTemplateEvent extends SmsTemplateFormEvent {
  const UpdateSmsTemplateEvent(this.smsTemplate);

  final SmsTemplateListShortDto smsTemplate;

  @override
  List<Object> get props => [smsTemplate];
}

class DeleteSmsTemplateEvent extends SmsTemplateFormEvent {
  const DeleteSmsTemplateEvent(this.smsTemplateId);

  final int smsTemplateId;

  @override
  List<Object> get props => [smsTemplateId];
}
