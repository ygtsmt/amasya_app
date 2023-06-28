import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/app/data/app_usecase.dart";
import "package:amasyaapp/app/data/models/account.dart";
import "package:amasyaapp/app/features/auth/features/login/data/login_usecase.dart";
import "package:amasyaapp/core/enums.dart";

part "login_event.dart";
part "login_state.dart";

@singleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUseCase, this._appUseCase) : super(const LoginState()) {
    on<LoginAccountEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _loginUseCase.login(event.email, event.password);

      await result.when(
        (final authInfo) async {
          final account = await _appUseCase.getAccount();
          // final garage = await _appUseCase.getGarage();
          // getIt<DriveListBloc>().add(GetDriveListEvent());
          // getIt<PeVehicleListBloc>().add(GetPeVehicleListEvent());
          // getIt<CustomerListBloc>().add(GetCustomerListEvent());
          // getIt<SmsTemplateListBloc>().add(GetSmsTemplateListEvent());
          // getIt<RightListBloc>().add(GetRightListEvent());
          // getIt<LicencePlateListBloc>().add(GetLicencePlateListEvent());
          // getIt<VehicleListBloc>().add(GetVehicleListEvent());
          // getIt<EmployeeListBloc>().add(GetEmployeeListEvent());
          // getIt<VehicleArchiveListBloc>().add(const GetVehicleArchiveListEvent());
          // getIt<DriveArchiveListBloc>().add(GetDriveArchiveListEvent());
          emit(state.copyWith(status: EventStatus.success, account: account.tryGetSuccess()));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });
  }

  final LoginUseCase _loginUseCase;

  final AppUseCase _appUseCase;
}
