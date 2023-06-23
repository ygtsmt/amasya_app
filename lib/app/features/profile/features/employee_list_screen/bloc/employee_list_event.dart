part of "employee_list_bloc.dart";

abstract class EmployeeListEvent extends Equatable {
  const EmployeeListEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeeListEvent extends EmployeeListEvent {}

class SearchEmployeeListEvent extends EmployeeListEvent {
  const SearchEmployeeListEvent(this.searchText);

  final String searchText;
  @override
  List<Object> get props => [searchText];
}
