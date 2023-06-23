part of "employee_form_bloc.dart";

abstract class _CreateEmployeeEvent extends Equatable {
  const _CreateEmployeeEvent();

  @override
  List<Object?> get props => [];
}

class GetEmployeeEvent extends _CreateEmployeeEvent {
  const GetEmployeeEvent({
    required this.employeeId,
  });

  final int employeeId;
  @override
  List<Object> get props => [employeeId];
}

class CreateEmployeeEvent extends _CreateEmployeeEvent {
  const CreateEmployeeEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
    required this.type,
    required this.garageId,
  });

  final String email;
  final String password;
  final String name;
  final String surname;
  final String phoneNumber;
  final String address;
  final DateTime birthDate;
  final int type;
  final int? garageId;
  @override
  List<Object?> get props => [email, password, name, surname, phoneNumber, address, type, birthDate, garageId];
}

class DeleteEmployeeEvent extends _CreateEmployeeEvent {
  const DeleteEmployeeEvent({
    required this.employeeId,
  });

  final int employeeId;
  @override
  List<Object> get props => [employeeId];
}

class UpdateEmployeeEvent extends _CreateEmployeeEvent {
  const UpdateEmployeeEvent(this.employee);

  final CreateEmployeeDto employee;

  @override
  List<Object> get props => [employee];
}
