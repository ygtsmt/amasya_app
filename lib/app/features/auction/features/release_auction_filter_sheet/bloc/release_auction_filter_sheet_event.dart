part of "release_auction_filter_sheet_bloc.dart";

abstract class ReleaseAuctionFilterSheetEvent extends Equatable {
  const ReleaseAuctionFilterSheetEvent();

  @override
  List<Object> get props => [];
}

class CreateAuctionFilterSheetEvent extends ReleaseAuctionFilterSheetEvent {
  const CreateAuctionFilterSheetEvent({required this.auction});

  final AuctionCreateDto auction;

  @override
  List<Object> get props => [auction];
}
