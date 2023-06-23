// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "pe_vehicle_list_bloc.dart";

class PeVehicleListState extends Equatable {
  const PeVehicleListState({
    required this.vehicle,
    required this.isLoading,
  });

  final List<VehicleShortDto> vehicle;
  final bool isLoading;

  PeVehicleListState copyWith({
    final List<VehicleShortDto>? vehicle,
    final bool? isLoading,
  }) {
    return PeVehicleListState(isLoading: isLoading ?? this.isLoading, vehicle: vehicle ?? this.vehicle);
  }

  @override
  List<Object> get props => [isLoading, vehicle];
}

class PeVehicleListInitial extends PeVehicleListState {
  const PeVehicleListInitial() : super(isLoading: false, vehicle: const []);
}
