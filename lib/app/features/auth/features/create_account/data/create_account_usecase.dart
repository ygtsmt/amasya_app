import "package:amasyaapp/app/data/models/account.dart";
import "package:amasyaapp/app/features/auth/features/create_account/data/models/create_account_request.dart";
import "package:amasyaapp/core/core.dart";
import 'package:dio/dio.dart';
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";

@injectable
class CreateAccountUseCase {
  const CreateAccountUseCase(
    this._snackBarService,
  );

  Future<Result<Account, String?>> createAccount(final CreateAccountRequest request) async {
    try {
      final result = await Dio().post(
        "/api/Account",
        data: request.toJson(),
      );

      return Result.success(Account.fromJson(result.data as Map<String, dynamic>));
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  final SnackBarService _snackBarService;
}
