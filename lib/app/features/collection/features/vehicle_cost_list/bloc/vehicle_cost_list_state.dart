part of "vehicle_cost_list_bloc.dart";

class VehicleCostListState extends Equatable {
  const VehicleCostListState({
    required this.isLoading,
    required this.vehicleCostList,
  });

  final bool isLoading;
  final List<VehicleCostListShortDto> vehicleCostList;

  VehicleCostListState copyWith({
    final bool? isLoading,
    final List<VehicleCostListShortDto>? vehicleCostList,
  }) {
    return VehicleCostListState(
      isLoading: isLoading ?? this.isLoading,
      vehicleCostList: vehicleCostList ?? this.vehicleCostList,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        vehicleCostList,
      ];
}

class VehicleCostListInitial extends VehicleCostListState {
  const VehicleCostListInitial()
      : super(
          isLoading: false,
          vehicleCostList: const [],
        );
}
