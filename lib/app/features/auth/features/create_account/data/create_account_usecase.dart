import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/data/models/account.dart";
import "package:revogarageapp/app/features/auth/features/create_account/data/models/create_account_request.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class CreateAccountUseCase {
  const CreateAccountUseCase(
    this._httpDataSource,
    this._snackBarService,
  );

  Future<Result<Account, String?>> createAccount(final CreateAccountRequest request) async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.post,
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

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;
}
