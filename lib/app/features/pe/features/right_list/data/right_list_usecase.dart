import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/models/right_list_short_dto.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class RightListUseCase {
  RightListUseCase(this._httpDataSource, this._snackBarService);

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<RightListShortDto>?, String?>> getRights(final int garageId) async {
    try {
      final garageId = getIt<AppBloc>().state.garage?.id;
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Right/GetRightByGarageId?garageId=$garageId",
      );

      final rights = (result.data as List<dynamic>)
          .map((final right) => RightListShortDto.fromJson(right as Map<String, dynamic>))
          .toList();

      return Result.success(rights);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
