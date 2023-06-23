import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/auction/features/release_auction_filter_sheet/data/auction_filter_sheet_usecase.dart";
import "package:revogarageapp/app/features/auction/features/release_auction_filter_sheet/data/model/auction_create_dto.dart";
import "package:revogarageapp/core/enums.dart";

part "release_auction_filter_sheet_event.dart";
part "release_auction_filter_sheet_state.dart";

@singleton
class ReleaseAuctionFilterSheetBloc extends Bloc<ReleaseAuctionFilterSheetEvent, ReleaseAuctionFilterSheetState> {
  ReleaseAuctionFilterSheetBloc(this._auctionFilterSheetUseCase) : super(const ReleaseAuctionFilterSheetState()) {
    on<CreateAuctionFilterSheetEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _auctionFilterSheetUseCase.createAuction(event.auction);

        result.when(
          (final success) {
            emit(state.copyWith(status: EventStatus.success));
            emit(state.copyWith(status: EventStatus.idle));
          },
          (final failure) {
            emit(state.copyWith(status: EventStatus.failure));
          },
        );
      },
    );
  }
  final AuctionFilterSheetUseCase _auctionFilterSheetUseCase;
}
