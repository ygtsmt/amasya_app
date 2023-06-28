import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/app/features/auth/features/create_account/data/create_account_usecase.dart";
import "package:amasyaapp/app/features/auth/features/create_account/data/models/create_account_request.dart";
import "package:amasyaapp/app/features/auth/features/login/data/login_usecase.dart";
import "package:amasyaapp/core/enums.dart";

part "create_account_event.dart";
part "create_account_state.dart";

@singleton
class CreateAccountBloc extends Bloc<_CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc(this._createAccountUseCase, this._loginUseCase) : super(const CreateAccountState()) {
    on<CreateAccountEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _createAccountUseCase.createAccount(
        CreateAccountRequest(
          name: event.name,
          surname: event.surname,
          phoneNumber: event.phoneNumber,
          address: event.address,
          birthDate: event.birthDate,
          email: event.email,
          password: event.password,
        ),
      );

      result.when(
        (final account) {
          emit(state.copyWith(status: EventStatus.success, accountId: account.id));
          _loginUseCase.login(event.email, event.password);
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });
  }

  final CreateAccountUseCase _createAccountUseCase;
  final LoginUseCase _loginUseCase;
}
