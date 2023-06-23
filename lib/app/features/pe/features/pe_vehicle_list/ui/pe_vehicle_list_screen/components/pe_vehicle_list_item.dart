// ignore_for_file: public_member_api_docs, sort_constructors_first
import "dart:convert";

import "package:flutter/material.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:revogarageapp/core/core.dart";

class PeVehicleListItem extends StatelessWidget {
  const PeVehicleListItem({
    required this.vehicle,
    super.key,
  });

  final VehicleShortDto vehicle;

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "${vehicle.vehicleBrandName} ${vehicle.vehicleModelName}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(vehicle.vin),
            enableFeedback: true,
            leading: vehicle.photoBase64 != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      base64Decode(vehicle.photoBase64!),
                      width: 200,
                      height: 100,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Images.logo,
                    ),
                  ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ],
      ),
    );
  }
}
