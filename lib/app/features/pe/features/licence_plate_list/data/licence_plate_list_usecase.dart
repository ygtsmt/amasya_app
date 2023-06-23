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
class LicencePlateListUseCase {
  LicencePlateListUseCase(this._httpDataSource, this._snackBarService);
  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<LicencePlateShortDto>?, String?>> getLicencePlates() async {
    try {
      final garageId = getIt<AppBloc>().state.garage?.id;
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/LicencePlate/GetLicencePlateByGarageId?garageId=$garageId",
      );

      final licencePlates = (result.data as List<dynamic>)
          .map((final vehicle) => LicencePlateShortDto.fromJson(vehicle as Map<String, dynamic>))
          .toList();

      return Result.success(licencePlates);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
