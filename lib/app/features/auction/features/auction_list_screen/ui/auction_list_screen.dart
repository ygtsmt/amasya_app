import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/auction/features/auction_list_screen/bloc/auction_list_bloc.dart";
import "package:revogarageapp/app/features/auction/features/auction_list_screen/ui/components/auction_list_item/auction_list_item.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class AuctionListScreen extends StatefulWidget {
  const AuctionListScreen({super.key});

  @override
  State<AuctionListScreen> createState() => _AuctionListScreenState();
}

class _AuctionListScreenState extends State<AuctionListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<AuctionListBloc>().add(GetAuctionListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        RevoScreenHeader(
          title: AppLocalizations.of(context).auction,
          actions: TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.current.search,
              prefixIcon: const Icon(
                Icons.search_outlined,
              ),
            ),
            onChanged: (final text) {
              if (text.isEmpty) {
                getIt<AuctionListBloc>().add(GetAuctionListEvent());
              } else {
                getIt<AuctionListBloc>().add(SearchAuctionEvent(text));
              }
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<AuctionListBloc, AuctionListState>(
            builder: (final context, final state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: state.auctions.length,
                itemBuilder: (final context, final index) {
                  return AuctionListItem(
                    auction: state.auctions[index],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
