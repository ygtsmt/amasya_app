import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_photo/data/models/vehicle_photo_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_photo/data/vehicle_photo_usecase.dart";
import "package:revogarageapp/core/core.dart";

part "vehicle_photo_event.dart";
part "vehicle_photo_state.dart";

@singleton
class VehiclePhotoBloc extends Bloc<VehiclePhotoEvent, VehiclePhotoState> {
  VehiclePhotoBloc(this._vehiclePhotoUseCase) : super(const VehiclePhotoState()) {
    on<GetVehiclePhotosEvent>((final event, final emit) async {
      final result = await _vehiclePhotoUseCase.getVehiclePhotos(event.vehicleId);

      result.when(
        (final vehiclePhotos) => emit(
          state.copyWith(
            vehiclePhotos: vehiclePhotos,
          ),
        ),
        (final error) => emit(
          state.copyWith(
            status: EventStatus.failure,
          ),
        ),
      );
    });

    on<AddVehiclePhotoEvent>((final event, final emit) async {
      final result = await _vehiclePhotoUseCase.addVehiclePhoto(event.file, event.vehicleId);

      result.when(
        (final vehiclePhotos) {
          if (vehiclePhotos.isNotEmpty && !vehiclePhotos.any((final photo) => true == photo.isDefault)) {
            add(SetDefaultVehiclePhotoEvent(vehiclePhotoId: vehiclePhotos.first.id, vehicleId: event.vehicleId));
          }
          emit(
            state.copyWith(
              vehiclePhotos: vehiclePhotos,
            ),
          );
        },
        (final error) {},
      );
    });

    on<DeleteVehiclePhotoEvent>((final event, final emit) async {
      final result = await _vehiclePhotoUseCase.deleteVehiclePhoto(event.vehiclePhotoId, event.vehicleId);

      result.when(
        (final vehiclePhotos) {
          if (vehiclePhotos.isNotEmpty && !vehiclePhotos.any((final photo) => true == photo.isDefault)) {
            add(SetDefaultVehiclePhotoEvent(vehiclePhotoId: vehiclePhotos.first.id, vehicleId: event.vehicleId));
          }

          emit(
            state.copyWith(
              vehiclePhotos: vehiclePhotos,
            ),
          );
        },
        (final error) => emit(
          state.copyWith(
            status: EventStatus.failure,
          ),
        ),
      );
    });

    on<SetDefaultVehiclePhotoEvent>((final event, final emit) async {
      // emit(state.copyWith(status: EventStatus.processing));

      final result = await _vehiclePhotoUseCase.setDefaultPhoto(event.vehiclePhotoId);

      result.when(
        (final success) {
          add(GetVehiclePhotosEvent(vehicleId: event.vehicleId));
        },
        (final error) => {},
      );
    });
  }

  final VehiclePhotoUseCase _vehiclePhotoUseCase;
}
