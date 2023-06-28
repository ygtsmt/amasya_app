part of "create_account_bloc.dart";

abstract class _CreateAccountEvent extends Equatable {
  const _CreateAccountEvent();

  @override
  List<Object?> get props => [];
}

class CreateAccountEvent extends _CreateAccountEvent {
  const CreateAccountEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    this.phoneNumber,
    this.address,
    this.birthDate,
    this.inviteCode,
  });

  final String email;
  final String password;
  final String name;
  final String surname;
  final String? phoneNumber;
  final String? address;
  final DateTime? birthDate;
  final String? inviteCode;

  @override
  List<Object?> get props => [email, password, name, surname, phoneNumber, address, birthDate, inviteCode];
}
