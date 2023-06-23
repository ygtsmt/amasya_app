part of "auction_list_bloc.dart";

abstract class AuctionListEvent extends Equatable {
  const AuctionListEvent();

  @override
  List<Object> get props => [];
}

class GetAuctionListEvent extends AuctionListEvent {}

class SearchAuctionEvent extends AuctionListEvent {
  const SearchAuctionEvent(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}
