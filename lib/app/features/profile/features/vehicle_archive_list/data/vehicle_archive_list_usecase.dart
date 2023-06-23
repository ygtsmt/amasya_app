import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class VehicleArchiveListUseCase {
  VehicleArchiveListUseCase(this._httpDataSource, this._snackBarService);
  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<VehicleShortDto>?, String?>> getVehicleArchives() async {
    try {
      final garageId = getIt<AppBloc>().state.garage?.id;
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Vehicle/GetVehiclesByGarageId?PageNumber=1&PageSize=1000&Property=Id&Asc=false&garageId=$garageId&isDeleted=true",
      );

      final vehicleArchives = (result.data as List<dynamic>)
          .map((final vehicleArchive) => VehicleShortDto.fromJson(vehicleArchive as Map<String, dynamic>))
          .toList();

      return Result.success(vehicleArchives);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<void, String?>> setVehicleArchive(final int id) async {
    try {
      await _httpDataSource.request(
        RequestMethod.patch,
        "/api/Vehicle/UndoDeleteVehicle",
        data: {"id": id},
      );

      return Result.success(null);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
