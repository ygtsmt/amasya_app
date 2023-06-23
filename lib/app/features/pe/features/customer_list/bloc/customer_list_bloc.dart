import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/data/customer_list_usecase.dart";
import "package:revogarageapp/core/injection/injection.dart";

part "customer_list_event.dart";
part "customer_list_state.dart";

@singleton
class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  CustomerListBloc(this._customerListUseCase) : super(const CustomerListInitial()) {
    on<GetCustomerListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));

      final garageId = getIt<AppBloc>().state.garage?.id;
      if (garageId == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      final result = await _customerListUseCase.getCustomers(garageId);

      result.when(
        (final success) {
          emit(state.copyWith(customerList: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchCustomerListEvent>(
      (final event, final emit) {
        final filtredCustomers = state.customerList
            .where((final customer) => customer.name.toLowerCase().contains(event.searchText.toLowerCase()));
        emit(state.copyWith(customerList: filtredCustomers.toList()));
      },
    );
  }

  final CustomerListUseCase _customerListUseCase;
}
