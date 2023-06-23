import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/data/models/vehicle_cost_list_short_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class VehicleCostFormUseCase {
  const VehicleCostFormUseCase(this._httpDataSource, this._snackBarService);

  Future<Result<int, String?>> createVehicleCosts(final int vehicleId, final String name, final double price) async {
    try {
      //final garageId = getIt<AppBloc>().state.account?.garageId;

      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/VehicleCost",
        data: {
          "vehicleId": vehicleId,
          "name": name,
          "price": price,
        },
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int?, String?>> deleteVehicleCost(final int vehicleCostId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/VehicleCost?Id=$vehicleCostId",
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> updateVehicleCosts(final VehicleCostListShortDto vehicleCostListShortDto) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/VehicleCost",
        data: vehicleCostListShortDto.toJson(),
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
