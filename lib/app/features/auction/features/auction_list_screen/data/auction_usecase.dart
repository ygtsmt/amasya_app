import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/auction/features/auction_list_screen/data/model/auction_short_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class AuctionListUseCase {
  AuctionListUseCase(this._httpDataSource, this._snackBarService);
  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<AuctionShortDto>?, String?>> getAuctions() async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Auction",
      );

      final auctions = (result.data as List<dynamic>)
          .map((final vehicle) => AuctionShortDto.fromJson(vehicle as Map<String, dynamic>))
          .toList();

      return Result.success(auctions);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
