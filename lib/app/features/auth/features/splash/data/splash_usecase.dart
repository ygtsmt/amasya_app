import "package:amasyaapp/app/data/models/account.dart";
import "package:amasyaapp/core/data_sources/local_data_source/secure_data_storage.dart";
import "package:amasyaapp/core/extensions.dart";
import "package:dio/dio.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";

@injectable
class SplashUseCase {
  const SplashUseCase(this._secureDataStorage);

  final SecureDataStorage _secureDataStorage;

  Future<Result<Account, String?>> autoLogin() async {
    try {
      final token = await _secureDataStorage.getToken();
      if (token == null) {
        return Result.error(null);
      }

      final response = await Dio().get("/api/Account/GetCurrentAccount");

      final account = Account.fromJson(response.data as Map<String, dynamic>);

      return Result.success(account);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      return Result.error(errorMessage);
    }
  }
}
