part of "vehicle_cost_form_bloc.dart";

class VehicleCostFormState extends Equatable {
  const VehicleCostFormState({this.status = EventStatus.idle});

  final EventStatus status;

  VehicleCostFormState copyWith({
    final EventStatus? status,
  }) {
    return VehicleCostFormState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
