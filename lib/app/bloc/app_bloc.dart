import "package:equatable/equatable.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/app/data/app_usecase.dart";
import "package:amasyaapp/app/data/models/account.dart";
import "package:amasyaapp/app/data/models/account_permission_dto.dart";
import "package:amasyaapp/app/data/models/garage.dart";
import "package:amasyaapp/app/features/collection/features/vehicle_list/bloc/vehicle_list_bloc.dart";
import "package:amasyaapp/core/core.dart";

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

        getIt<VehicleListBloc>().add(GetVehicleListEvent());
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
