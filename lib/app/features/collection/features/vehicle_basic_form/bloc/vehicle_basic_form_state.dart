part of "vehicle_basic_form_bloc.dart";

class VehicleBasicFormState extends Equatable {
  const VehicleBasicFormState({
    this.brands,
    this.models,
    this.colors,
    this.fuelTypes,
    this.selectedVehicle,
    this.createVehicleStatus = EventStatus.idle,
    this.updateVehicleStatus = EventStatus.idle,
  });
  final List<VehicleBrand>? brands;
  final List<VehicleModel>? models;
  final List<VehicleColor>? colors;
  final List<FuelType>? fuelTypes;
  final Vehicle? selectedVehicle;
  final EventStatus createVehicleStatus;
  final EventStatus updateVehicleStatus;

  VehicleBasicFormState copyWith({
    final List<VehicleBrand>? brands,
    final List<VehicleModel>? models,
    final List<VehicleColor>? colors,
    final List<FuelType>? fuelTypes,
    final Vehicle? selectedVehicle,
    final EventStatus? createVehicleStatus,
    final EventStatus? updateVehicleStatus,
  }) {
    return VehicleBasicFormState(
      brands: brands ?? this.brands,
      models: models ?? this.models,
      colors: colors ?? this.colors,
      fuelTypes: fuelTypes ?? this.fuelTypes,
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
      createVehicleStatus: createVehicleStatus ?? this.createVehicleStatus,
      updateVehicleStatus: updateVehicleStatus ?? this.updateVehicleStatus,
    );
  }

  @override
  List<Object?> get props =>
      [brands, models, colors, fuelTypes, selectedVehicle, createVehicleStatus, updateVehicleStatus];
}
