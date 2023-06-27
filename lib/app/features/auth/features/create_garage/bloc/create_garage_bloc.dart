import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/app/features/auth/features/create_garage/data/create_garage_usecase.dart";
import "package:amasyaapp/app/features/auth/features/create_garage/data/models/create_garage_request.dart";
import "package:amasyaapp/core/enums.dart";

part "create_garage_event.dart";
part "create_garage_state.dart";

@singleton
class CreateGarageBloc extends Bloc<CreateGarageEvent, CreateGarageState> {
  CreateGarageBloc(this._createGarageUseCase) : super(const CreateGarageState()) {
    on<CreateGarageRequestEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _createGarageUseCase.createGarage(event.request);

      result.when(
        (final garage) {
          emit(state.copyWith(status: EventStatus.success));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });
  }

  final CreateGarageUseCase _createGarageUseCase;
}
