import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/models/right_list_short_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class RightFormUseCase {
  const RightFormUseCase(this._httpDataSource, this._snackBarService);

  Future<Result<int, String?>> createRights(final String name, final String text) async {
    try {
      final garageId = getIt<AppBloc>().state.account?.garageId;

      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/Right",
        data: {
          "name": name,
          "text": text,
          "garageId": garageId,
        },
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> updateRights(final RightListShortDto rightListShortDto) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/Right",
        data: rightListShortDto.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int?, String?>> deleteRight(final int rightId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/Right?Id=$rightId",
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
