part of "send_short_sms_bloc.dart";

class SendShortSmsState extends Equatable {
  const SendShortSmsState({
    this.status = EventStatus.idle,
  });

  final EventStatus status;

  SendShortSmsState copyWith({
    final EventStatus? status,
  }) {
    return SendShortSmsState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
