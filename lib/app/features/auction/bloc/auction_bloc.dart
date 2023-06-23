import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

part "auction_event.dart";
part "auction_state.dart";

class AuctionBloc extends Bloc<AuctionEvent, AuctionState> {
  AuctionBloc() : super(AuctionInitial()) {
    on<AuctionEvent>((final event, final emit) {});
  }
}
