part of "vehicle_cost_form_bloc.dart";

abstract class VehicleCostFormEvent extends Equatable {
  const VehicleCostFormEvent();

  @override
  List<Object> get props => [];
}

class CreateVehicleCostEvent extends VehicleCostFormEvent {
  const CreateVehicleCostEvent({required this.vehicleId, required this.name, required this.price});

  final int vehicleId;
  final String name;
  final double price;

  @override
  List<Object> get props => [vehicleId, name, price];
}

class DeleteVehicleCostEvent extends VehicleCostFormEvent {
  const DeleteVehicleCostEvent({
    required this.vehicleCostId,
  });

  final int vehicleCostId;
  @override
  List<Object> get props => [vehicleCostId];
}

class UpdateVehicleCostEvent extends VehicleCostFormEvent {
  const UpdateVehicleCostEvent(this.vehicleCost);

  final VehicleCostListShortDto vehicleCost;

  @override
  List<Object> get props => [vehicleCost];
}
