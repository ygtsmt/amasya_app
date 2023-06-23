import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_form/data/licence_plate_form_usecase.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/models/licence_plate_short_dto.dart";
import "package:revogarageapp/core/enums.dart";

part "licence_plate_form_event.dart";
part "licence_plate_form_state.dart";

@singleton
class LicencePlateFormBloc extends Bloc<LicencePlateFormEvent, LicencePlateFormState> {
  LicencePlateFormBloc(this._licencePlateFormUseCase) : super(const LicencePlateFormState()) {
    on<CreateLicencePlateEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _licencePlateFormUseCase.createLicencePlate(event.licencePlate);

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

    on<UpdateLicencePlateEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _licencePlateFormUseCase.updateLicencePlate(event.licencePlate);

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

    on<DeleteLicencePlateEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _licencePlateFormUseCase.deleteLicencePlate(event.licencePlateId);

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

  final LicencePlateFormUseCase _licencePlateFormUseCase;
}
