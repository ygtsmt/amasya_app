import "package:amasyaapp/app/data/models/account.dart";
import "package:amasyaapp/app/data/models/account_permission_dto.dart";
import "package:amasyaapp/app/data/models/garage.dart";
import "package:amasyaapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:amasyaapp/core/data_sources/local_data_source/secure_data_storage.dart";
import "package:amasyaapp/core/enums.dart";
import "package:amasyaapp/core/extensions.dart";
import "package:amasyaapp/core/services/snackbar_service.dart";
import "package:amasyaapp/generated/l10n.dart";
import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";

@injectable
class AppUseCase {
  AppUseCase(this._secureDataStorage, this._httpDataSource, this._snackBarService);

  final SecureDataStorage _secureDataStorage;
  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<void> setThemeMode(final ThemeMode themeMode) async {
    await _secureDataStorage.saveThemeMode(themeMode);
  }

  Future<void> logout() async {
    await _secureDataStorage.deleteAll();
  }

  Future<Result<Garage?, String?>> getGarage() async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Garage/GetCurrentAccountGarage",
      );

      final garage = Garage.fromJson(result.data as Map<String, dynamic>);
      return Result.success(garage);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<Account?, String?>> getAccount() async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Account/GetCurrentAccount",
      );

      final account = Account.fromJson(result.data as Map<String, dynamic>);
      return Result.success(account);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<AccountPermissionDto>, String?>> getAccountPermissions() async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/AccountPermission",
      );

      final accountPermissions = (result.data as List<dynamic>)
          .map((final permission) => AccountPermissionDto.fromJson(permission as Map<String, dynamic>))
          .toList();
      return Result.success(accountPermissions);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<void, String?>> deleteAccount(final int accountId, final String password) async {
    try {
      await _httpDataSource.request(
        RequestMethod.delete,
        "/api/Account?Id=$accountId&Password=$password",
      );

      return Result.success(null);
    } catch (e) {
      _snackBarService.showSnackBar(AppLocalizations.current.password_error);
      return Result.error(null);
    }
  }
}
