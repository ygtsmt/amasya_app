part of "drive_form_bloc.dart";

abstract class DriveFormEvent extends Equatable {
  const DriveFormEvent();

  @override
  List<Object> get props => [];
}

class GetCustomersEvent extends DriveFormEvent {}

class GetLicencePlatesEvent extends DriveFormEvent {}

class GetVehiclesEvent extends DriveFormEvent {}

class GetRightsEvent extends DriveFormEvent {}

class SaveDriveEvent extends DriveFormEvent {
  const SaveDriveEvent(this.drive);

  final DriveDto drive;

  @override
  List<Object> get props => [drive];
}

class UpdateDriveEvent extends DriveFormEvent {
  const UpdateDriveEvent(this.drive);

  final DriveDto drive;

  @override
  List<Object> get props => [drive];
}

class DeleteDriveEvent extends DriveFormEvent {
  const DeleteDriveEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class SendDrivePdfEvent extends DriveFormEvent {
  const SendDrivePdfEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
