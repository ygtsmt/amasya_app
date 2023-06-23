part of "vehicle_photo_bloc.dart";

abstract class VehiclePhotoEvent extends Equatable {
  const VehiclePhotoEvent();

  @override
  List<Object> get props => [];
}

class AddVehiclePhotoEvent extends VehiclePhotoEvent {
  const AddVehiclePhotoEvent({
    required this.file,
    required this.vehicleId,
  });

  final XFile file;
  final int vehicleId;

  @override
  List<Object> get props => [file, vehicleId];
}

class GetVehiclePhotosEvent extends VehiclePhotoEvent {
  const GetVehiclePhotosEvent({
    required this.vehicleId,
  });

  final int vehicleId;

  @override
  List<Object> get props => [vehicleId];
}

class DeleteVehiclePhotoEvent extends VehiclePhotoEvent {
  const DeleteVehiclePhotoEvent({
    required this.vehiclePhotoId,
    required this.vehicleId,
  });

  final int vehiclePhotoId;
  final int vehicleId;

  @override
  List<Object> get props => [vehiclePhotoId, vehicleId];
}

class SetDefaultVehiclePhotoEvent extends VehiclePhotoEvent {
  const SetDefaultVehiclePhotoEvent({
    required this.vehiclePhotoId,
    required this.vehicleId,
  });

  final int vehiclePhotoId;
  final int vehicleId;

  @override
  List<Object> get props => [vehiclePhotoId, vehicleId];
}
