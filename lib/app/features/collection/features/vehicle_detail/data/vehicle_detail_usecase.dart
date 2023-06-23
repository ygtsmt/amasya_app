import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/models.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class VehicleDetailUseCase {
  VehicleDetailUseCase(this._httpDataSource, this._snackBarService);
  Future<Result<VehicleLongDto, String?>> getVehicleDetail(final int vehicleId) async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Vehicle/GetVehicleById?vehicleId=$vehicleId",
      );

      final vehicle = VehicleLongDto.fromJson(result.data as Map<String, dynamic>);

      return Result.success(vehicle);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<void, String?>> setVehicleType(final int vehicleId, final int vehicleTypeId) async {
    try {
      await _httpDataSource.request(
        RequestMethod.patch,
        "/api/Vehicle/ChangeVehicleType",
        data: {"vehicleId": vehicleId, "type": vehicleTypeId},
      );

      return Result.success(null);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<void, String?>> deleteVehicle(final int vehicleId) async {
    try {
      await _httpDataSource.request(
        RequestMethod.delete,
        "/api/Vehicle?Id=$vehicleId",
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
