import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/app/data/models/account.dart";
import "package:amasyaapp/app/features/auth/features/splash/data/splash_usecase.dart";
import "package:amasyaapp/core/enums.dart";

part "splash_event.dart";
part "splash_state.dart";

@singleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._splashUseCase) : super(const SplashState()) {
    on<AutoLoginRequestEvent>((final event, final emit) async {
      emit(state.copyWith(autoLoginStatus: EventStatus.processing));

      final getAccountResult = await _splashUseCase.autoLogin();

      getAccountResult.when((final success) {
        emit(state.copyWith(autoLoginStatus: EventStatus.success, account: success));
      }, (final error) {
        emit(state.copyWith(autoLoginStatus: EventStatus.failure));
      });
    });
  }

  final SplashUseCase _splashUseCase;
}
