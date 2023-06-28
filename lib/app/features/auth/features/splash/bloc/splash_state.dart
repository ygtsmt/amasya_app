part of "splash_bloc.dart";

class SplashState extends Equatable {
  const SplashState({this.autoLoginStatus = EventStatus.idle, this.account});

  final EventStatus autoLoginStatus;

  final Account? account;

  SplashState copyWith({final EventStatus? autoLoginStatus, final Account? account}) {
    return SplashState(
      autoLoginStatus: autoLoginStatus ?? this.autoLoginStatus,
      account: account ?? this.account,
    );
  }

  @override
  List<Object?> get props => [autoLoginStatus, account];
}
