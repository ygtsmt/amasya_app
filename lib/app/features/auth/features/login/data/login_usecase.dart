import "dart:io";

import "package:device_info_plus/device_info_plus.dart";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:amasyaapp/app/features/auth/features/splash/data/models/account_auth.dart";
import "package:amasyaapp/core/core.dart";
import "package:amasyaapp/generated/l10n.dart";

@injectable
class LoginUseCase {
  const LoginUseCase( this._secureDataStorage, this._snackBarService);

  Future<Result<AccountAuth, String?>> login(final String email, final String password) async {
    final deviceInfo = DeviceInfoPlugin();

    String deviceName = "UNKNOWN";

    if (kIsWeb) {
      deviceName = "WEB";
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.identifierForVendor ?? "Unknown";
    } else if (Platform.isMacOS) {
      deviceName = "MACOS";
    } else if (Platform.isWindows) {
      deviceName = "WINDOWS";
    } else if (Platform.isLinux) {
      deviceName = "LINUX";
    } else if (Platform.isFuchsia) {
      deviceName = "FUCHSIA";
    }

    try {
      final result = await Dio().post(
        "/api/Login",
        data: {"email": email, "password": password, "deviceName": deviceName},
      );

      final authInfo = AccountAuth.fromJson(result.data as Map<String, dynamic>);
      await _secureDataStorage.saveToken(authInfo.accessToken);
      await _secureDataStorage.saveRefreshToken(authInfo.refreshToken);
      return Result.success(authInfo);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(AppLocalizations.current.login_error);
      return Result.error(errorMessage);
    }
  }

  final SecureDataStorage _secureDataStorage;
  final SnackBarService _snackBarService;
}
