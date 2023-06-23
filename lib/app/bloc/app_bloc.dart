import "package:equatable/equatable.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/data/app_usecase.dart";
import "package:revogarageapp/app/data/models/account.dart";
import "package:revogarageapp/app/data/models/account_permission_dto.dart";
import "package:revogarageapp/app/data/models/garage.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/bloc/vehicle_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/bloc/customer_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/bloc/drive_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/bloc/licence_plate_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/pe_vehicle_list/bloc/pe_vehicle_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_list/bloc/right_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/bloc/sms_template_list_bloc.dart";
import "package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_list/bloc/drive_archive_list_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/bloc/employee_list_bloc.dart";
import "package:revogarageapp/app/features/profile/features/vehicle_archive_list/bloc/vehicle_archive_list_bloc.dart";
import "package:revogarageapp/core/core.dart";

part "app_event.dart";
part "app_state.dart";

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._appUseCase) : super(const AppState()) {
    on<SetThemeEvent>((final event, final emit) {
      emit(state.copyWith(themeMode: event.themeMode));
    });

    on<GetGarageEvent>((final event, final emit) async {
      final result = await _appUseCase.getGarage();

      if (result.isSuccess()) {
        emit(state.copyWith(garage: result.tryGetSuccess()));

        getIt<DriveListBloc>().add(GetDriveListEvent());
        getIt<PeVehicleListBloc>().add(GetPeVehicleListEvent());
        getIt<CustomerListBloc>().add(GetCustomerListEvent());
        getIt<SmsTemplateListBloc>().add(GetSmsTemplateListEvent());
        getIt<RightListBloc>().add(GetRightListEvent());
        getIt<LicencePlateListBloc>().add(GetLicencePlateListEvent());
        getIt<VehicleListBloc>().add(GetVehicleListEvent());
        getIt<EmployeeListBloc>().add(GetEmployeeListEvent());
        getIt<VehicleArchiveListBloc>().add(const GetVehicleArchiveListEvent());
        getIt<DriveArchiveListBloc>().add(GetDriveArchiveListEvent());
      }
    });

    on<GetAccountEvent>((final event, final emit) async {
      final result = await _appUseCase.getAccount();

      if (result.isSuccess()) {
        final accountPermissionResult = await _appUseCase.getAccountPermissions();

        if (accountPermissionResult.isSuccess()) {
          final accountPermissions = accountPermissionResult.tryGetSuccess()!;
          final hasCollectionAccess =
              accountPermissions.any((final accountPermission) => accountPermission.name == "Collection");
          final hasAuctionAccess =
              accountPermissions.any((final accountPermission) => accountPermission.name == "Auction");
          final hasPeAccess = accountPermissions.any((final accountPermission) => accountPermission.name == "PE");

          emit(
            state.copyWith(
              account: result.tryGetSuccess(),
              accountPermissions: accountPermissions,
              hasCollectionAccess: hasCollectionAccess,
              hasAuctionAccess: hasAuctionAccess,
              hasPeAccess: hasPeAccess,
            ),
          );
        }
      }
    });

    on<DeleteAccountEvent>((final event, final emit) async {
      final result = await _appUseCase.deleteAccount(event.accountId, event.password);
      emit(state.copyWith(deleteAccountEventStatus: EventStatus.processing));

      if (result.isSuccess()) {
        emit(state.copyWith(deleteAccountEventStatus: EventStatus.success));
        emit(state.copyWith(deleteAccountEventStatus: EventStatus.idle));
      } else {
        emit(state.copyWith(deleteAccountEventStatus: EventStatus.failure));
        emit(state.copyWith(deleteAccountEventStatus: EventStatus.idle));
      }
    });
  }

  final AppUseCase _appUseCase;
}
