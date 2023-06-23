import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:revogarageapp/app/features/auction/features/auction_list_screen/data/model/auction_short_dto.dart";
import "package:revogarageapp/core/images.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";
import "package:slide_countdown/slide_countdown.dart";

class AuctionListItem extends StatefulWidget {
  const AuctionListItem({super.key, this.auction});
  final AuctionShortDto? auction;
  @override
  State<AuctionListItem> createState() => _AuctionListItemState();
}

class _AuctionListItemState extends State<AuctionListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const AuctionVehicleDetailsRoute());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Card(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              image: DecorationImage(
                image: AssetImage(Images.lamborghini),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CountDown()],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(widget.auction!.vehicleBrand),
                        Text(widget.auction!.vehicleModel),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.euro_outlined,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(widget.auction!.startPrice.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.back_hand,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text("0"),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          AppLocalizations.of(context).binds,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountDown extends StatelessWidget {
  const CountDown({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    late final StreamDuration streamDuration = StreamDuration(const Duration(days: 1));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SlideCountdown(
        streamDuration: streamDuration,
        separator: ":",
        decoration: BoxDecoration(
          // color: ThemeData.dark().canvasColor,
          borderRadius: BorderRadius.circular(29),
        ),
        shouldShowDays: (final p1) => true,
        icon: const Padding(
          padding: EdgeInsets.all(4),
          child: Icon(Icons.alarm),
        ),
      ),
    );
  }
}
