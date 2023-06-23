import "package:flutter/material.dart";
import "package:revogarageapp/core/images.dart";

class BoughtVehiclesListItem extends StatefulWidget {
  const BoughtVehiclesListItem({super.key});

  @override
  State<BoughtVehiclesListItem> createState() => _BoughtVehiclesListItemState();
}

class _BoughtVehiclesListItemState extends State<BoughtVehiclesListItem> {
  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Renault Clio",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            subtitle: const Text("12312312312312322"),
            enableFeedback: true,
            leading: Image.asset(
              Images.sampleCar,
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ],
      ),
    );
  }
}
