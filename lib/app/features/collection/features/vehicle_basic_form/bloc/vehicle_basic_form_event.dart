part of "vehicle_basic_form_bloc.dart";

abstract class VehicleBasicFormEvent extends Equatable {
  const VehicleBasicFormEvent();

  @override
  List<Object?> get props => [];
}

class GetBrandsEvent extends VehicleBasicFormEvent {}

class GetColorsEvent extends VehicleBasicFormEvent {}

class GetFuelTypesEvent extends VehicleBasicFormEvent {}

class GetVehicleListEvent extends VehicleBasicFormEvent {}

class GetModelsEvent extends VehicleBasicFormEvent {
  const GetModelsEvent({required this.brandId});
  final int? brandId;

  @override
  List<Object?> get props => [brandId];
}

class CreateVehicleEvent extends VehicleBasicFormEvent {
  const CreateVehicleEvent({required this.request});
  final VehicleCreateRequest request;

  @override
  List<Object> get props => [request];
}

class UpdateVehicleEvent extends VehicleBasicFormEvent {
  const UpdateVehicleEvent({required this.vehicle});
  final VehicleLongDto vehicle;

  @override
  List<Object> get props => [vehicle];
}
