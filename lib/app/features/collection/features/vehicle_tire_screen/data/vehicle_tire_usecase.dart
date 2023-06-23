import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/data/models/list_item_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/data/models/vehicle_tire_detail_dto.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class VehicleTireUseCase {
  VehicleTireUseCase(this._httpDataSource, this._snackBarService);

  Future<Result<List<ListItemDto>, String?>> getTireBrands() async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.get,
        "/api/TireBrand?pageNumber=1&pageSize=10000&Property=Name&ASC=true",
      );

      final tireBrands =
          (response.data as List<dynamic>).map((final e) => ListItemDto.fromJson(e as Map<String, dynamic>)).toList();

      return Result.success(tireBrands);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<ListItemDto>, String?>> getTireRims() async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.get,
        "/api/TireRim?pageNumber=1&pageSize=10000&Property=Name&ASC=true",
      );

      final tireRims =
          (response.data as List<dynamic>).map((final e) => ListItemDto.fromJson(e as Map<String, dynamic>)).toList();

      return Result.success(tireRims);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<VehicleTireDetailDto>, String?>> getTires(final int vehicleId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Tire?vehicleId=$vehicleId",
      );

      final tires = (response.data as List<dynamic>)
          .map((final e) => VehicleTireDetailDto.fromJson(e as Map<String, dynamic>))
          .toList();

      return Result.success(tires);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<void, String?>> addTire(final int vehicleId, final VehicleTireDetailDto tire) async {
    try {
      await _httpDataSource.request(
        RequestMethod.post,
        "/api/Tire",
        data: {
          "vehicleId": vehicleId,
          "tireCreateSubDto": [tire.toJson()],
        },
      );

      _snackBarService.showSnackBar("Tire added successfully");
      return Result.success(null);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<void, String?>> updateTire(final int vehicleId, final VehicleTireDetailDto tire) async {
    try {
      await _httpDataSource.request(
        RequestMethod.patch,
        "/api/Tire",
        data: {
          "vehicleId": vehicleId,
          "tireUpdateSubDto": [tire.toJson()],
        },
      );

      _snackBarService.showSnackBar("Tire updated successfully");
      return Result.success(null);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int?, String?>> deleteTire(final int tireId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/Tire?Id=$tireId",
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
