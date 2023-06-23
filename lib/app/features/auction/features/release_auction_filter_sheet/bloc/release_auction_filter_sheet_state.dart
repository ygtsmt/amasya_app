part of "release_auction_filter_sheet_bloc.dart";

class ReleaseAuctionFilterSheetState extends Equatable {
  const ReleaseAuctionFilterSheetState({
    this.status = EventStatus.idle,
  });

  final EventStatus status;

  ReleaseAuctionFilterSheetState copyWith({
    final EventStatus? status,
  }) {
    return ReleaseAuctionFilterSheetState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}

class ReleaseAuctionFilterSheetInitial extends ReleaseAuctionFilterSheetState {}
