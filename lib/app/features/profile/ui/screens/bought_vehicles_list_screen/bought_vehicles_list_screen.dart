import "package:flutter/material.dart";
import "package:revogarageapp/app/features/profile/ui/screens/bought_vehicles_list_screen/components/bought_vehicles_list_item.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/generated/l10n.dart";

class BoughtVehicleListScreen extends StatefulWidget {
  const BoughtVehicleListScreen({super.key});

  @override
  State<BoughtVehicleListScreen> createState() => _BoughtVehicleListScreenState();
}

class _BoughtVehicleListScreenState extends State<BoughtVehicleListScreen> {
  // final bool _switchValue = false;
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        RevoScreenHeader(
          title: AppLocalizations.of(context).boughtVehicles,
          actions: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list_outlined,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (final BuildContext context, final int index) {
              return const BoughtVehiclesListItem();
            },
          ),
        )
      ],
    );
  }
}
