import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/data/models/vehicle_cost_list_short_dto.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class VehicleCostListUseCase {
  VehicleCostListUseCase(this._httpDataSource, this._snackBarService);

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<VehicleCostListShortDto>?, String?>> getVehicleCosts(final int vehicleId) async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/VehicleCost/GetVehicleCostsByVehicleId?PageNumber=1&PageSize=1000&Property=Id&Asc=false&vehicleId=$vehicleId",
      );

      final vehicleCosts = (result.data as List<dynamic>)
          .map((final vehicleCost) => VehicleCostListShortDto.fromJson(vehicleCost as Map<String, dynamic>))
          .toList();

      return Result.success(vehicleCosts);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
