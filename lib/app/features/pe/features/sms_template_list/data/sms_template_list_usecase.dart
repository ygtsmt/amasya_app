import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/data/models/sms_template_list_short_dto.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class SmsTemplateListUseCase {
  SmsTemplateListUseCase(this._httpDataSource, this._snackBarService);

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<SmsTemplateListShortDto>?, String?>> getSmsTemplates(final int garageId) async {
    try {
      final garageId = getIt<AppBloc>().state.garage?.id;
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/SmsTemplate/GetSmsTemplateByGarageId?garageId=$garageId",
      );

      final smsTemplates = (result.data as List<dynamic>)
          .map((final smsTemplate) => SmsTemplateListShortDto.fromJson(smsTemplate as Map<String, dynamic>))
          .toList();

      return Result.success(smsTemplates);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
