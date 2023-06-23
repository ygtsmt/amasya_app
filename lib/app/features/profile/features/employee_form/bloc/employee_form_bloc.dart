import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/data/create_employee_usecase.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/data/models/create_employee_dto.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/data/models/employee.dart";
import "package:revogarageapp/core/enums.dart";

part "employee_form_event.dart";
part "employee_form_state.dart";

@singleton
class EmployeeFormBloc extends Bloc<_CreateEmployeeEvent, CreateEmployeeState> {
  EmployeeFormBloc(this._createEmployeeUseCase) : super(const CreateEmployeeState()) {
    on<CreateEmployeeEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _createEmployeeUseCase.createEmployee(
          CreateEmployeeDto(
            name: event.name,
            surname: event.surname,
            phoneNumber: event.phoneNumber,
            address: event.address,
            birthDate: event.birthDate,
            email: event.email,
            password: event.password,
            type: event.type,
            garageId: event.garageId!,
          ),
        );
        result.when(
          (final account) {
            emit(
              state.copyWith(
                status: EventStatus.success,
              ),
            );
          },
          (final error) {
            emit(state.copyWith(status: EventStatus.failure));
          },
        );
      },
    );
    on<GetEmployeeEvent>(
      (final event, final emit) async {
        emit(state.copyWith(getEmployeeStatus: EventStatus.processing));

        final result = await _createEmployeeUseCase.getEmployee(event.employeeId);

        result.when(
          (final employee) {
            emit(state.copyWith(getEmployeeStatus: EventStatus.success, employee: employee));
            emit(state.copyWith(getEmployeeStatus: EventStatus.idle));
          },
          (final error) {
            emit(state.copyWith(getEmployeeStatus: EventStatus.failure));
          },
        );
      },
    );
    on<DeleteEmployeeEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _createEmployeeUseCase.deleteEmployee(event.employeeId);

        result.when(
          (final success) {
            emit(state.copyWith(status: EventStatus.success));
            emit(state.copyWith(status: EventStatus.idle));
          },
          (final error) {
            emit(state.copyWith(status: EventStatus.failure));
          },
        );
      },
    );
    on<UpdateEmployeeEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _createEmployeeUseCase.updateEmployee(event.employee);

        result.when(
          (final success) {
            emit(state.copyWith(status: EventStatus.success));
            emit(state.copyWith(status: EventStatus.idle));
          },
          (final failure) {
            emit(state.copyWith(status: EventStatus.failure));
          },
        );
      },
    );
  }

  final CreateEmployeeUseCase _createEmployeeUseCase;
}
