import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/models/drive_dto.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class DriveFormUseCase {
  DriveFormUseCase(this._httpDataSource, this._snackBarService);
  Future<Result<int, String?>> saveDrive(final DriveDto drive) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/Drive",
        data: drive.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> updateDrive(final DriveDto drive) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/Drive",
        data: drive.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> deleteDrive(final int driveId) async {
    try {
      await _httpDataSource.request(
        RequestMethod.delete,
        "/api/Drive?Id=$driveId",
      );
      return Result.success(driveId);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<void, String?>> sendDrivePdf(final int driveId) async {
    try {
      await _httpDataSource.request(
        RequestMethod.post,
        "/api/Drive/SendDrivePdf",
        data: {"id": driveId},
      );
      return Result.success(null);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(null);
    }
  }

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;
}
