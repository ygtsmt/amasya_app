import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class SendShortSmsShortSmsUseCase {
  SendShortSmsShortSmsUseCase(this._httpDataSource, this._snackBarService);

  Future<Result<void, String?>> sendSms(
    final String smsText,
    final List<String?> phoneNumbers,
  ) async {
    try {
      await _httpDataSource.request(
        RequestMethod.post,
        "/api/TwilioSms",
        data: {
          "body": smsText,
          "phoneNumbers": phoneNumbers,
        },
      );
      return Result.success(null);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;
}
