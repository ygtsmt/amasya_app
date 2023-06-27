import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:amasyaapp/app/bloc/app_bloc.dart";
import "package:amasyaapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:amasyaapp/core/core.dart";

@injectable
class VehicleListUseCase {
  VehicleListUseCase(this._httpDataSource, this._snackBarService);
  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<VehicleShortDto>?, String?>> getVehicles() async {
    try {
      final garageId = getIt<AppBloc>().state.garage?.id;
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Vehicle/GetVehiclesByGarageId?pageNumber=1&pageSize=10000&Property=Id&ASC=false&garageId=$garageId",
      );

      final vehicles = (result.data as List<dynamic>)
          .map((final vehicle) => VehicleShortDto.fromJson(vehicle as Map<String, dynamic>))
          .toList();

      return Result.success(vehicles);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
