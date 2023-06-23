part of "employee_form_bloc.dart";

class CreateEmployeeState extends Equatable {
  const CreateEmployeeState({
    this.status = EventStatus.idle,
    this.employee,
    this.getEmployeeStatus = EventStatus.idle,
  });

  final EventStatus status;
  final EventStatus getEmployeeStatus;
  final Employee? employee;

  CreateEmployeeState copyWith({
    final EventStatus? status,
    final Employee? employee,
    final EventStatus? getEmployeeStatus,
  }) {
    return CreateEmployeeState(
      status: status ?? this.status,
      employee: employee ?? this.employee,
      getEmployeeStatus: getEmployeeStatus ?? this.getEmployeeStatus,
    );
  }

  @override
  List<Object?> get props => [status, employee, getEmployeeStatus];
}
