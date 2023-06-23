part of "auction_list_bloc.dart";

class AuctionListState extends Equatable {
  const AuctionListState({
    required this.isLoading,
    required this.auctions,
  });

  final bool isLoading;
  final List<AuctionShortDto> auctions;

  AuctionListState copyWith({
    final bool? isLoading,
    final List<AuctionShortDto>? auctions,
  }) {
    return AuctionListState(
      isLoading: isLoading ?? this.isLoading,
      auctions: auctions ?? this.auctions,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        auctions,
      ];
}

class AuctionListInitial extends AuctionListState {
  const AuctionListInitial()
      : super(
          isLoading: false,
          auctions: const [],
        );
}
