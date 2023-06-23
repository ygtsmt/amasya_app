import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/models/drive_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class DriveListUseCase {
  DriveListUseCase(this._httpDataSource, this._snackBarService);
  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<DriveDto>?, String?>> getDrives() async {
    try {
      final garageId = getIt<AppBloc>().state.garage?.id;
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Drive/GetDrivesByGarageId?PageNumber=1&PageSize=100000&Property=Id&Asc=false&garageId=$garageId",
      );

      final drives = (result.data as List<dynamic>)
          .map((final vehicle) => DriveDto.fromJson(vehicle as Map<String, dynamic>))
          .toList();

      return Result.success(drives);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
