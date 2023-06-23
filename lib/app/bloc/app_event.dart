part of "app_bloc.dart";

class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class SetThemeEvent extends AppEvent {
  const SetThemeEvent(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}

class GetGarageEvent extends AppEvent {}

class GetAccountEvent extends AppEvent {}

class DeleteAccountEvent extends AppEvent {
  const DeleteAccountEvent(this.accountId, this.password);

  final int accountId;
  final String password;

  @override
  List<Object> get props => [accountId, password];
}
