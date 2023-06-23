part of "customer_form_bloc.dart";

class CustomerFormState extends Equatable {
  const CustomerFormState({this.status = EventStatus.idle});

  final EventStatus status;

  CustomerFormState copyWith({
    final EventStatus? status,
  }) {
    return CustomerFormState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}

class CustomerFormInitial extends CustomerFormState {}
