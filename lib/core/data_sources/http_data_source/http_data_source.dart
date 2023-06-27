import "dart:io";

import "package:device_info_plus/device_info_plus.dart";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/app/features/auth/features/splash/data/models/account_auth.dart";
import "package:amasyaapp/core/core.dart";
import "package:amasyaapp/flavors.dart";

@singleton
class HttpDataSource {
  HttpDataSource(this._dio, this._localDataSource) {
    _dio.options.baseUrl = F.apiBaseUrl;
    _dio.options.validateStatus = (final status) => status != null && status == 200;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (final options, final handler) async {
          options.headers["Content-Type"] = "application/json";
          options.headers["Accept"] = "application/json";

          options.headers["Accept-Language"] = getFullCultureName();
          options.headers["Authorization"] = "Bearer ${await _localDataSource.getToken()}";
          return handler.next(options);
        },
        onResponse: (final response, final handler) async {
          return handler.next(response);
        },
        onError: (final error, final handler) async {
          return refreshToken(error, handler);
        },
      ),
    );
  }

  Future<void> refreshToken(final DioError error, final ErrorInterceptorHandler handler) async {
    if (error.response == null || error.response?.statusCode == 401) {
      try {
        final refreshToken = await _localDataSource.getRefreshToken();

        if (refreshToken != null) {
          final isSuccess = await _refreshToken(refreshToken);
          if (isSuccess) {
            return handler.resolve(await _retry(error.requestOptions));
          } else {
            return handler.next(error);
          }
        }
      } catch (e) {
        return handler.next(error);
      }
    }
    return handler.next(error);
  }

  Future<Response<dynamic>> _retry(final RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> _refreshToken(final String refreshToken) async {
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
      final response = await Dio(
        BaseOptions(
          baseUrl: F.apiBaseUrl,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Accept-Language": "en-US",
          },
        ),
      ).post<Map<String, dynamic>>(
        "/api/Login/RefreshTokenLogin",
        data: {"refreshToken": refreshToken, "deviceName": deviceName},
      );

      if (response.data != null) {
        final accountAuth = AccountAuth.fromJson(response.data!);
        await _localDataSource.saveToken(accountAuth.accessToken);
        await _localDataSource.saveRefreshToken(accountAuth.refreshToken);

        return true;
      } else {
        _localDataSource.deleteAll();
        getIt<AppRouter>().replace(const LoginScreenRoute());
        getIt<AppRouter>().popUntilRoot();
        getIt<AppRouter>().popForced();
        await getIt<AppRouter>().root.replaceAll([const SplashScreenRoute()]);
        return false;
      }
    } catch (e) {
      _localDataSource.deleteAll();
      getIt<AppRouter>().replace(const LoginScreenRoute());
      getIt<AppRouter>().popUntilRoot();
      getIt<AppRouter>().popForced();
      await getIt<AppRouter>().root.replaceAll([const SplashScreenRoute()]);

      return false;
    }
  }

  final Dio _dio;
  final SecureDataStorage _localDataSource;

  Future<Response<dynamic>> request(
    final RequestMethod method,
    final String path, {
    final dynamic data,
  }) {
    try {
      return _dio.request(
        path,
        data: data,
        options: Options(
          method: method.value,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
