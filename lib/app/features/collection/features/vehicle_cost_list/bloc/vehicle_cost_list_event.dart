part of "vehicle_cost_list_bloc.dart";

abstract class VehicleCostListEvent extends Equatable {
  const VehicleCostListEvent();

  @override
  List<Object> get props => [];
}

class GetVehicleCostListEvent extends VehicleCostListEvent {
  const GetVehicleCostListEvent(this.vehicleId);

  final int vehicleId;

  @override
  List<Object> get props => [vehicleId];
}
