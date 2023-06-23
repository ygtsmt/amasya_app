part of "customer_list_bloc.dart";

class CustomerListState extends Equatable {
  const CustomerListState({
    required this.isLoading,
    required this.customerList,
  });

  final bool isLoading;
  final List<CustomerDto> customerList;

  CustomerListState copyWith({
    final bool? isLoading,
    final List<CustomerDto>? customerList,
  }) {
    return CustomerListState(
      isLoading: isLoading ?? this.isLoading,
      customerList: customerList ?? this.customerList,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        customerList,
      ];
}

class CustomerListInitial extends CustomerListState {
  const CustomerListInitial()
      : super(
          isLoading: false,
          customerList: const [],
        );
}
