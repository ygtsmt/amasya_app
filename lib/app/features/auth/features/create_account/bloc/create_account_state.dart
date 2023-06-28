part of "create_account_bloc.dart";

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.status = EventStatus.idle,
    this.accountId,
  });

  final EventStatus status;
  final int? accountId;

  CreateAccountState copyWith({
    final EventStatus? status,
    final int? accountId,
  }) {
    return CreateAccountState(
      status: status ?? this.status,
      accountId: accountId ?? this.accountId,
    );
  }

  @override
  List<Object?> get props => [status, accountId];
}
