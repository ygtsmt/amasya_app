part of "login_bloc.dart";

class LoginState extends Equatable {
  const LoginState({
    this.status = EventStatus.idle,
    this.account,
  });

  final EventStatus status;
  final Account? account;

  LoginState copyWith({
    final EventStatus? status,
    final Account? account,
  }) {
    return LoginState(
      status: status ?? this.status,
      account: account ?? this.account,
    );
  }

  @override
  List<Object?> get props => [status, account];
}
