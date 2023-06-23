import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_form/data/vehicle_damage_form_usecase.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/bloc/vehicle_damage_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/damage_photo_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/vehicle_damage_list_short_dto.dart";
import "package:revogarageapp/core/core.dart";

part "vehicle_damage_form_event.dart";
part "vehicle_damage_form_state.dart";

@singleton
class VehicleDamageFormBloc extends Bloc<VehicleDamageFormEvent, VehicleDamageFormState> {
  VehicleDamageFormBloc(this._vehicleDamageFormUseCase) : super(const VehicleDamageFormState()) {
    on<CreateDamageEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _vehicleDamageFormUseCase.createDamages(
        event.vehicleId,
        event.name,
        event.description,
        event.price,
        event.photos,
      );
      result.when(
        (final success) async {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<UpdateDamageEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _vehicleDamageFormUseCase.updateDamages(event.damage);

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

    on<DeleteDamageEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _vehicleDamageFormUseCase.deleteDamages(event.damageId);

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

    on<AddDamagePhotoEvent>((final event, final emit) async {
      final result = await _vehicleDamageFormUseCase.addDamagePhoto(event.damageId, event.photo);

      if (result.isSuccess()) {
        getIt<VehicleDamageListBloc>().add(GetVehicleDamageListEvent(event.vehicleId));
      }
    });

    on<DeleteDamagePhotoEvent>((final event, final emit) async {
      final result = await _vehicleDamageFormUseCase.deleteDamagePhoto(event.photoId);

      if (result.isSuccess()) {
        getIt<VehicleDamageListBloc>().add(GetVehicleDamageListEvent(event.vehicleId));
      }
    });
  }

  final VehicleDamageFormUseCase _vehicleDamageFormUseCase;
}
