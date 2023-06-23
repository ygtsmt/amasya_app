part of "auction_bloc.dart";

abstract class AuctionState extends Equatable {
  const AuctionState();

  @override
  List<Object> get props => [];
}

class AuctionInitial extends AuctionState {}
