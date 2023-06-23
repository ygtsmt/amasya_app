import "package:flutter/material.dart";
import "package:revogarageapp/app/features/auction/features/auction_list_screen/ui/components/auction_list_item/auction_list_item.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/generated/l10n.dart";

class AuctionVehicleDetails extends StatefulWidget {
  const AuctionVehicleDetails({super.key});

  @override
  State<AuctionVehicleDetails> createState() => _AuctionVehicleDetailsState();
}

class _AuctionVehicleDetailsState extends State<AuctionVehicleDetails> {
  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RevoScreenHeader(title: AppLocalizations.of(context).vehicle_details),
          const SizedBox(
            height: 14,
          ),
          const CountDown(),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context).insert_price),
              const Text("155 CHF"),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context).current_price),
              const Text("155 CHF"),
            ],
          ),
          const Divider(),
          const Text("Brand: Lamborghini"),
          const Divider(),
          const Text("Model: Aventador"),
          const Divider(),
          const Text("Engine Power: 6.5-Liter 769-Hp"),
          const Divider(),
          const Text("Transmission: Automatic"),
          const Divider(),
          const Text("Fuel: Benzine"),
          const Divider(),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // this will add 10 minutes to the remaining duration
                    // streamDuration.add(const Duration(hours: 10));
                  },
                  child: Text(AppLocalizations.of(context).extend_auction_time),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context).close_deal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
