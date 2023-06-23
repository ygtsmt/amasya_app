import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/pe/ui/screens/send_short_sms_screen/data/send_short_sms_usecase.dart";
import "package:revogarageapp/core/enums.dart";

part "send_short_sms_event.dart";
part "send_short_sms_state.dart";

@singleton
class SendShortSmsBloc extends Bloc<SendShortSmsEvent, SendShortSmsState> {
  SendShortSmsBloc(this._sendShortSmsShortSmsUseCase) : super(const SendShortSmsState()) {
    on<SendSmsEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));
      final result = await _sendShortSmsShortSmsUseCase.sendSms(event.smsText, event.phoneNumbers);

      result.when(
        (final data) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });
  }

  final SendShortSmsShortSmsUseCase _sendShortSmsShortSmsUseCase;
}
