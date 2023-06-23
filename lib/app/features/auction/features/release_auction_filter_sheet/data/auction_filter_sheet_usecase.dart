import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/auction/features/release_auction_filter_sheet/data/model/auction_create_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class AuctionFilterSheetUseCase {
  const AuctionFilterSheetUseCase(this._httpDataSource, this._snackBarService);

  Future<Result<int, String?>> createAuction(final AuctionCreateDto auction) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/Auction",
        data: auction.toJson(),
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
