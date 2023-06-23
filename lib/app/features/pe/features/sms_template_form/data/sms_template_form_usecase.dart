import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/data/models/sms_template_list_short_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class SmsTemplateFormUseCase {
  const SmsTemplateFormUseCase(this._httpDataSource, this._snackBarService);

  Future<Result<int, String?>> createSmsTemplate(final String smsTemplateName, final String smsTemplateText) async {
    try {
      final garageId = getIt<AppBloc>().state.account?.garageId;

      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/SmsTemplate",
        data: {"name": smsTemplateName, "text": smsTemplateText, "garageId": garageId},
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> updateSmsTemplate(final SmsTemplateListShortDto smsTemplateShortDto) async {
    // smstemplate e list i sonradan ekledim kontorl et
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/SmsTemplate",
        data: smsTemplateShortDto.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int?, String?>> deleteSmsTemplate(final int smsTemplateId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/SmsTemplate?Id=$smsTemplateId",
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;
}
