part of "customer_list_bloc.dart";

abstract class CustomerListEvent extends Equatable {
  const CustomerListEvent();

  @override
  List<Object> get props => [];
}

class GetCustomerListEvent extends CustomerListEvent {}

class SearchCustomerListEvent extends CustomerListEvent {
  const SearchCustomerListEvent(this.searchText);

  final String searchText;
  @override
  List<Object> get props => [searchText];
}
