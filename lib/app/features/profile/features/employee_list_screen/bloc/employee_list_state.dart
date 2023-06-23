part of "employee_list_bloc.dart";

class EmployeeListState extends Equatable {
  const EmployeeListState({
    required this.isLoading,
    required this.employeeList,
  });

  final bool isLoading;
  final List<EmployeeListShortDto> employeeList;

  EmployeeListState copyWith({
    final bool? isLoading,
    final List<EmployeeListShortDto>? employeeList,
  }) {
    return EmployeeListState(
      isLoading: isLoading ?? this.isLoading,
      employeeList: employeeList ?? this.employeeList,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        employeeList,
      ];
}

class EmployeeListInitial extends EmployeeListState {
  const EmployeeListInitial()
      : super(
          isLoading: false,
          employeeList: const [],
        );
}
