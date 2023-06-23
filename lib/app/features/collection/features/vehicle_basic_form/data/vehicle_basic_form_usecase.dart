import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_basic_form/data/models/models.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/models.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class VehicleBasicFormUseCase {
  VehicleBasicFormUseCase(this._httpDataSource, this._snackBarService);
  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<int, String?>> createVehicle(final VehicleCreateRequest vehicle) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/Vehicle",
        data: vehicle.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> updateVehicle(final VehicleLongDto vehicle) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/Vehicle",
        data: vehicle.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<VehicleBrand>, String?>> getBrands() async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.get,
        "/api/VehicleBrand?pageNumber=1&pageSize=10000&Property=Name&ASC=true",
      );

      final brands =
          (response.data as List<dynamic>).map((final e) => VehicleBrand.fromJson(e as Map<String, dynamic>)).toList();

      return Result.success(brands);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<VehicleModel>, String?>> getModels(final int brandId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.get,
        "/api/VehicleModel/GetVehicleModelsByVehicleBrandId?vehicleId=$brandId",
      );

      final models =
          (response.data as List<dynamic>).map((final e) => VehicleModel.fromJson(e as Map<String, dynamic>)).toList();

      return Result.success(models);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<VehicleColor>, String?>> getColors() async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.get,
        "/api/VehicleColor?pageNumber=1&pageSize=10000&Property=Name&ASC=true",
      );

      final colors =
          (response.data as List<dynamic>).map((final e) => VehicleColor.fromJson(e as Map<String, dynamic>)).toList();

      return Result.success(colors);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<FuelType>, String?>> getFuelTypes() async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.get,
        "/api/VehicleFuelType?pageNumber=1&pageSize=10000&Property=Name&ASC=true",
      );

      final fuelTypes =
          (response.data as List<dynamic>).map((final e) => FuelType.fromJson(e as Map<String, dynamic>)).toList();

      return Result.success(fuelTypes);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
