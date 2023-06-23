import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_form/data/sms_template_form_usecase.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/data/models/sms_template_list_short_dto.dart";
import "package:revogarageapp/core/enums.dart";

part "sms_template_form_event.dart";
part "sms_template_form_state.dart";

@singleton
class SmsTemplateFormBloc extends Bloc<SmsTemplateFormEvent, SmsTemplateFormState> {
  SmsTemplateFormBloc(this._smsTemplateFormUseCase) : super(const SmsTemplateFormState()) {
    on<CreateSmsTemplateEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _smsTemplateFormUseCase.createSmsTemplate(event.smsTemplateName, event.smsTemplateText);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final failure) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<UpdateSmsTemplateEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _smsTemplateFormUseCase.updateSmsTemplate(event.smsTemplate);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final failure) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<DeleteSmsTemplateEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _smsTemplateFormUseCase.deleteSmsTemplate(event.smsTemplateId);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final failure) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });
  }

  final SmsTemplateFormUseCase _smsTemplateFormUseCase;
}
