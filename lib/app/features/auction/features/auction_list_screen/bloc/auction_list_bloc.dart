import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/auction/features/auction_list_screen/data/auction_usecase.dart";
import "package:revogarageapp/app/features/auction/features/auction_list_screen/data/model/auction_short_dto.dart";

part "auction_list_event.dart";
part "auction_list_state.dart";

@singleton
class AuctionListBloc extends Bloc<AuctionListEvent, AuctionListState> {
  AuctionListBloc(this._auctionListUseCase) : super(const AuctionListInitial()) {
    on<GetAuctionListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await _auctionListUseCase.getAuctions();

      result.when(
        (final success) {
          emit(state.copyWith(auctions: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchAuctionEvent>((final event, final emit) {
      final filteredAuctions = state.auctions.where(
        (final auction) =>
            auction.vehicleBrand.toLowerCase().contains(event.searchText.toLowerCase()) ||
            auction.vehicleModel.toLowerCase().contains(event.searchText.toLowerCase()),
      );

      emit(state.copyWith(auctions: filteredAuctions.toList()));
    });
  }

  final AuctionListUseCase _auctionListUseCase;
}
