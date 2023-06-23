import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/customer_form_usecase.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/core/enums.dart";

part "customer_form_event.dart";
part "customer_form_state.dart";

@singleton
class CustomerFormBloc extends Bloc<CustomerFormEvent, CustomerFormState> {
  CustomerFormBloc(this._customerFormUseCase) : super(const CustomerFormState()) {
    on<CreateCustomerEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _customerFormUseCase.createCustomers(
        event.customer,
      );

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<UpdateCustomerEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _customerFormUseCase.updateCustomers(event.customer);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final failure) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<DeleteCustomerEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _customerFormUseCase.deleteCustomer(event.customerId);

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
  }

  final CustomerFormUseCase _customerFormUseCase;
}
