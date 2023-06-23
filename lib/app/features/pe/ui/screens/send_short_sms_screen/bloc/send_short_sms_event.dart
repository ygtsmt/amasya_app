part of "send_short_sms_bloc.dart";

abstract class SendShortSmsEvent extends Equatable {
  const SendShortSmsEvent();

  @override
  List<Object> get props => [];
}

class SendSmsEvent extends SendShortSmsEvent {
  const SendSmsEvent({
    required this.smsText,
    required this.phoneNumbers,
  });
  final String smsText;
  final List<String?> phoneNumbers;

  @override
  List<Object> get props => [
        smsText,
        phoneNumbers,
      ];
}
