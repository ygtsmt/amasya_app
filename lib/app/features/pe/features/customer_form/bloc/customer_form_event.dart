part of "customer_form_bloc.dart";

abstract class CustomerFormEvent extends Equatable {
  const CustomerFormEvent();

  @override
  List<Object?> get props => [];
}

class CreateCustomerEvent extends CustomerFormEvent {
  const CreateCustomerEvent(
    this.customer,
  );
//final int id;
//final int garageId;

  final CustomerDto customer;

  @override
  List<Object?> get props => [customer];
}

class UpdateCustomerEvent extends CustomerFormEvent {
  const UpdateCustomerEvent(this.customer);

  final CustomerDto customer;

  @override
  List<Object> get props => [customer];
}

class DeleteCustomerEvent extends CustomerFormEvent {
  const DeleteCustomerEvent({
    required this.customerId,
  });

  final int customerId;
  @override
  List<Object> get props => [customerId];
}
