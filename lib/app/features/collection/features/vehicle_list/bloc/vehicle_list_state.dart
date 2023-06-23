part of "vehicle_list_bloc.dart";

class VehicleListState extends Equatable {
  const VehicleListState({
    required this.vehicles,
    required this.isLoading,
  });

  final List<VehicleShortDto> vehicles;
  final bool isLoading;

  VehicleListState copyWith({
    final List<VehicleShortDto>? vehicles,
    final bool? isLoading,
  }) {
    return VehicleListState(
      vehicles: vehicles ?? this.vehicles,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [vehicles, isLoading];
}

class VehicleListInitial extends VehicleListState {
  const VehicleListInitial()
      : super(
          vehicles: const [],
          isLoading: false,
        );
}
