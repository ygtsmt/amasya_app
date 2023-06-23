import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/data/models/sms_template_list_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/data/sms_template_list_usecase.dart";
import "package:revogarageapp/core/injection/injection.dart";

part "sms_template_list_event.dart";
part "sms_template_list_state.dart";

@singleton
class SmsTemplateListBloc extends Bloc<SmsTemplateListEvent, SmsTemplateListState> {
  SmsTemplateListBloc(this._smsTemplateListUseCase) : super(const SmsTemplateListInitial()) {
    on<GetSmsTemplateListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));

      final garageId = getIt<AppBloc>().state.garage?.id;
      if (garageId == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      final result = await _smsTemplateListUseCase.getSmsTemplates(garageId);

      result.when(
        (final success) {
          emit(state.copyWith(smsTemplateList: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchSmsTemplateListEvent>(
      (final event, final emit) {
        final filtredSmsTemplates = state.smsTemplateList
            .where((final smsTemplates) => smsTemplates.name.toLowerCase().contains(event.searchText.toLowerCase()));
        emit(state.copyWith(smsTemplateList: filtredSmsTemplates.toList()));
      },
    );
  }

  final SmsTemplateListUseCase _smsTemplateListUseCase;
}
