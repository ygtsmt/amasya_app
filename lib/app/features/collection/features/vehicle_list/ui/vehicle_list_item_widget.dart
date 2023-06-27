import "dart:convert";

import "package:amasyaapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:amasyaapp/core/core.dart";
import "package:flutter/material.dart";

class VehicleListItemWidget extends StatelessWidget {
  const VehicleListItemWidget({
    required this.vehicle,
    this.isPressable = true,
    super.key,
  });

  final VehicleShortDto vehicle;
  final bool isPressable;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "${vehicle.vehicleBrandName} ${vehicle.vehicleModelName}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: vehicle.vin.isEmpty
                      ? Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 16,
                              color: Theme.of(context).colorScheme.errorContainer,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "VIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Theme.of(context).colorScheme.errorContainer),
                            ),
                          ],
                        )
                      : Text(vehicle.vin),
                  onTap: !isPressable
                      ? null
                      : () {
                          /*  context.router.push(VehicleDetailScreenRoute(vehicleId: vehicle.id)).then((final value) {
                            getIt<VehicleListBloc>().add(GetVehicleListEvent());
                          }); */
                        },
                  enableFeedback: true,
                  trailing: vehicle.photoBase64 == null
                      ? Image.asset(
                          Images.logo,
                          fit: BoxFit.cover,
                          width: 130,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            gaplessPlayback: true,
                            base64Decode(vehicle.photoBase64!),
                            fit: BoxFit.cover,
                            width: 130,
                          ),
                        ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              color: vehicle.isNew
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.errorContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                vehicle.isNew ? "New" : "Used",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
