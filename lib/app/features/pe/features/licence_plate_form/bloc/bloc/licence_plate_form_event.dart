part of "licence_plate_form_bloc.dart";

abstract class LicencePlateFormEvent extends Equatable {
  const LicencePlateFormEvent();

  @override
  List<Object> get props => [];
}

class CreateLicencePlateEvent extends LicencePlateFormEvent {
  const CreateLicencePlateEvent({required this.licencePlate});

  final String licencePlate;

  @override
  List<Object> get props => [licencePlate];
}

class UpdateLicencePlateEvent extends LicencePlateFormEvent {
  const UpdateLicencePlateEvent(this.licencePlate);

  final LicencePlateShortDto licencePlate;

  @override
  List<Object> get props => [licencePlate];
}

class DeleteLicencePlateEvent extends LicencePlateFormEvent {
  const DeleteLicencePlateEvent(this.licencePlateId);

  final int licencePlateId;

  @override
  List<Object> get props => [licencePlateId];
}
