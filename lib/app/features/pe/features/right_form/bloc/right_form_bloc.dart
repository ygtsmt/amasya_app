import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/pe/features/right_form/data/right_form_usecase.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/models/right_list_short_dto.dart";
import "package:revogarageapp/core/enums.dart";

part "right_form_event.dart";
part "right_form_state.dart";

@singleton
class RightFormBloc extends Bloc<RightFormEvent, RightFormState> {
  RightFormBloc(this._rightFormUseCase) : super(const RightFormState()) {
    on<CreateRightEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _rightFormUseCase.createRights(event.name, event.text);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<UpdateRightEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _rightFormUseCase.updateRights(event.right);

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

    on<DeleteRightEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _rightFormUseCase.deleteRight(event.rightId);

        result.when(
          (final success) {
            emit(state.copyWith(status: EventStatus.success));
            emit(state.copyWith(status: EventStatus.idle));
          },
          (final error) {
            emit(state.copyWith(status: EventStatus.failure));
          },
        );
      },
    );
  }

  final RightFormUseCase _rightFormUseCase;
}
