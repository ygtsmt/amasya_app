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
class PeVehicleListUseCase {
  PeVehicleListUseCase(this._httpDataSource, this._snackBarServices);

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarServices;

  Future<Result<List<VehicleShortDto>?, String?>> getVehicles() async {
    try {
      final garageId = getIt<AppBloc>().state.garage?.id;
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Vehicle/GetVehiclesByGarageId?PageNumber=1&PageSize=1000&Property=Id&Asc=false&garageId=$garageId&type=${VehicleType.inPe}",
      );
      final vehicles = (result.data as List<dynamic>)
          .map((final vehicle) => VehicleShortDto.fromJson(vehicle as Map<String, dynamic>))
          .toList();
      return Result.success(vehicles);
    } catch (e) {
      final errorMassage = e.getHttpErrorMessage();
      _snackBarServices.showSnackBar(errorMassage);
      return Result.error(errorMassage);
    }
  }
}
