import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/vehicle_damage_list_short_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class VehicleDamageListUseCase {
  VehicleDamageListUseCase(this._httpDataSource, this._snackBarService);

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<VehicleDamageListShortDto>?, String?>> getDamages(final int vehicleId) async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/VehicleDamage?PageNumber=1&PageSize=1000&Property=Id&Asc=false&vehicleId=$vehicleId",
      );

      final damages = (result.data as List<dynamic>)
          .map((final damage) => VehicleDamageListShortDto.fromJson(damage as Map<String, dynamic>))
          .toList();

      return Result.success(damages);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
