part of "drive_form_bloc.dart";

class DriveFormState extends Equatable {
  const DriveFormState({
    this.customers = const [],
    this.licencePlates = const [],
    this.vehicles = const [],
    this.rights = const [],
    this.status = EventStatus.idle,
  });

  final List<VehicleShortDto> vehicles;
  final List<LicencePlateShortDto> licencePlates;
  final List<CustomerDto> customers;
  final List<RightListShortDto> rights;

  final EventStatus status;

  DriveFormState copyWith({
    final List<VehicleShortDto>? vehicles,
    final List<LicencePlateShortDto>? licencePlates,
    final List<CustomerDto>? customers,
    final List<RightListShortDto>? rights,
    final EventStatus? status,
  }) {
    return DriveFormState(
      vehicles: vehicles ?? this.vehicles,
      licencePlates: licencePlates ?? this.licencePlates,
      customers: customers ?? this.customers,
      rights: rights ?? this.rights,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        vehicles,
        licencePlates,
        customers,
        rights,
        status,
      ];
}
