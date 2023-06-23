part of "sms_template_form_bloc.dart";

class SmsTemplateFormState extends Equatable {
  const SmsTemplateFormState({
    this.status = EventStatus.idle,
  });

  final EventStatus status;

  SmsTemplateFormState copyWith({
    final EventStatus? status,
  }) {
    return SmsTemplateFormState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
