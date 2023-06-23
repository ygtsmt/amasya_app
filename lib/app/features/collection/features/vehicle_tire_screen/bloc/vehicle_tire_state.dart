part of "vehicle_tire_bloc.dart";

class VehicleTireState extends Equatable {
  const VehicleTireState({
    this.tireBrands,
    this.tireRims,
    this.tires,
    this.status = EventStatus.idle,
  });

  final EventStatus status;
  final List<ListItemDto>? tireBrands;
  final List<ListItemDto>? tireRims;
  final List<VehicleTireDetailDto>? tires;

  VehicleTireState copyWith({
    final List<ListItemDto>? tireBrands,
    final List<ListItemDto>? tireRims,
    final List<VehicleTireDetailDto>? tires,
    final EventStatus? status,
  }) {
    return VehicleTireState(
      tireBrands: tireBrands ?? this.tireBrands,
      tireRims: tireRims ?? this.tireRims,
      tires: tires ?? this.tires,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [tireBrands, tireRims, tires, status];
}
