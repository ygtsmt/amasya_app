import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/models/licence_plate_short_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class LicencePlateFormUseCase {
  const LicencePlateFormUseCase(this._httpDataSource, this._snackBarService);

  Future<Result<int, String?>> createLicencePlate(final String licencePlate) async {
    try {
      final garageId = getIt<AppBloc>().state.account?.garageId;

      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/LicencePlate",
        data: {
          "plate": licencePlate,
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

  Future<Result<int, String?>> updateLicencePlate(final LicencePlateShortDto licencePlateShortDto) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/LicencePlate",
        data: licencePlateShortDto.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int?, String?>> deleteLicencePlate(final int licencePlateId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/LicencePlate?Id=$licencePlateId",
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
