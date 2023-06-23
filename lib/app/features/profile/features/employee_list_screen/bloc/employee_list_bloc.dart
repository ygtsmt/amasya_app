import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/data/employee_list_usecase.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/data/models/employee_list_short_dto.dart";
import "package:revogarageapp/core/injection/injection.dart";

part "employee_list_event.dart";
part "employee_list_state.dart";

@singleton
class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  EmployeeListBloc(this._employeeListUseCase) : super(const EmployeeListInitial()) {
    on<GetEmployeeListEvent>(
      (final event, final emit) async {
        emit(state.copyWith(isLoading: true));

        final garageId = getIt<AppBloc>().state.garage?.id;
        if (garageId == null) {
          emit(state.copyWith(isLoading: false));
          return;
        }

        final result = await _employeeListUseCase.getEmployees(garageId);

        result.when(
          (final success) {
            emit(state.copyWith(employeeList: success, isLoading: false));
          },
          (final error) {
            emit(state.copyWith(isLoading: false));
          },
        );
      },
    );

    on<SearchEmployeeListEvent>(
      (final event, final emit) {
        final filtredEmployees = state.employeeList
            .where((final employees) => employees.name.toLowerCase().contains(event.searchText.toLowerCase()));
        emit(state.copyWith(employeeList: filtredEmployees.toList()));
      },
    );
  }

  final EmployeeListUseCase _employeeListUseCase;
}
