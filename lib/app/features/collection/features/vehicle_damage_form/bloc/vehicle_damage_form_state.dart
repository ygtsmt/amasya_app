part of "vehicle_damage_form_bloc.dart";

class VehicleDamageFormState extends Equatable {
  const VehicleDamageFormState({this.status = EventStatus.idle});

  final EventStatus status;

  VehicleDamageFormState copyWith({
    final EventStatus? status,
  }) {
    return VehicleDamageFormState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}

class VehicleDamageFormInitial extends VehicleDamageFormState {}
