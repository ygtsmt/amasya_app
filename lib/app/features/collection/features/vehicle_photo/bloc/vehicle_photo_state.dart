part of "vehicle_photo_bloc.dart";

class VehiclePhotoState extends Equatable {
  const VehiclePhotoState({
    this.status = EventStatus.idle,
    this.vehiclePhotos,
  });

  final EventStatus status;
  final List<VehiclePhotoDto>? vehiclePhotos;

  VehiclePhotoState copyWith({
    final EventStatus? status,
    final List<VehiclePhotoDto>? vehiclePhotos,
  }) {
    return VehiclePhotoState(
      status: status ?? this.status,
      vehiclePhotos: vehiclePhotos ?? this.vehiclePhotos,
    );
  }

  @override
  List<Object?> get props => [status, vehiclePhotos];
}
