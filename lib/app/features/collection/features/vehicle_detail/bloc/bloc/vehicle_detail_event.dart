part of "vehicle_detail_bloc.dart";

abstract class VehicleDetailEvent extends Equatable {
  const VehicleDetailEvent();

  @override
  List<Object> get props => [];
}

class GetVehicleDetailEvent extends VehicleDetailEvent {
  const GetVehicleDetailEvent(this.vehicleId);
  final int vehicleId;

  @override
  List<Object> get props => [vehicleId];
}

class SetVehicleTypeEvent extends VehicleDetailEvent {
  const SetVehicleTypeEvent(this.vehicleId, this.vehicleTypeId);
  final int vehicleTypeId;
  final int vehicleId;

  @override
  List<Object> get props => [vehicleTypeId, vehicleId];
}

class DeleteVehicleEvent extends VehicleDetailEvent {
  const DeleteVehicleEvent(this.vehicleId);
  final int vehicleId;

  @override
  List<Object> get props => [vehicleId];
}
