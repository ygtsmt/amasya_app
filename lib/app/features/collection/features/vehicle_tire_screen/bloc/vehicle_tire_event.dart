part of "vehicle_tire_bloc.dart";

abstract class VehicleTireEvent extends Equatable {
  const VehicleTireEvent();

  @override
  List<Object> get props => [];
}

class GetTireBrands extends VehicleTireEvent {}

class GetTireRims extends VehicleTireEvent {}

class GetTiresEvent extends VehicleTireEvent {
  const GetTiresEvent(this.vehicleId);

  final int vehicleId;
}

class AddTireEvent extends VehicleTireEvent {
  const AddTireEvent(this.vehicleId, this.tire);

  final int vehicleId;
  final VehicleTireDetailDto tire;
}

class UpdateTireEvent extends VehicleTireEvent {
  const UpdateTireEvent(this.vehicleId, this.tire);

  final int vehicleId;
  final VehicleTireDetailDto tire;
}

class DeleteTireEvent extends VehicleTireEvent {
  const DeleteTireEvent({
    required this.tireId,
  });

  final int tireId;
  @override
  List<Object> get props => [tireId];
}
