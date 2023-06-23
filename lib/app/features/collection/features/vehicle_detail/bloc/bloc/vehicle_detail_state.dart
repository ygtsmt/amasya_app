part of "vehicle_detail_bloc.dart";

class VehicleDetailState extends Equatable {
  const VehicleDetailState({
    this.vehicleLongDto,
    this.getVehicleDetailStatus = EventStatus.idle,
  });

  final EventStatus getVehicleDetailStatus;
  final VehicleLongDto? vehicleLongDto;

  VehicleDetailState copyWith({
    final VehicleLongDto? vehicleLongDto,
    final EventStatus? getVehicleDetailStatus,
  }) {
    return VehicleDetailState(
      vehicleLongDto: vehicleLongDto ?? this.vehicleLongDto,
      getVehicleDetailStatus: getVehicleDetailStatus ?? this.getVehicleDetailStatus,
    );
  }

  @override
  List<Object?> get props => [getVehicleDetailStatus, vehicleLongDto];
}
