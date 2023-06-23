// ignore_for_file: public_member_api_docs, sort_constructors_first

import "dart:convert";

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/bloc/bloc/vehicle_detail_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_photo/bloc/vehicle_photo_bloc.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleSummaryCard extends StatelessWidget {
  final VehicleLongDto vehicle;
  const VehicleSummaryCard({
    required this.vehicle,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<VehiclePhotoBloc, VehiclePhotoState>(
      builder: (final context, final vehiclePhotoState) {
        return BlocBuilder<VehicleDetailBloc, VehicleDetailState>(
          builder: (final context, final vehicleDetailState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: <Widget>[
                    if (vehiclePhotoState.vehiclePhotos?.any((final photo) => true == photo.isDefault) ?? false)
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            gaplessPlayback: true,
                            base64Decode(
                              vehiclePhotoState.vehiclePhotos!.where((final element) => element.isDefault).first.base64,
                            ),
                            width: 200,
                            height: 100,
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            Images.logo,
                          ),
                        ),
                      ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              vehicle.vin,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "${vehicle.vehicleBrandName} ${vehicle.vehicleModelName}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              vehicle.vehicleColorName,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        showMoveToPeDialog(
                          context,
                          vehicle,
                        );
                      },
                      icon: Icon(
                        Icons.track_changes,
                        color: vehicleDetailState.vehicleLongDto?.type == VehicleType.inPe
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        alertDialogArchive(context, vehicle);
                      },
                      icon: Icon(
                        Icons.archive_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    /*   IconButton(
                      onPressed: () {
                        getIt<BottomSheetService>().show(
                          context,
                          RealaseAuctionFilterSheet(vehicle: vehicle),
                        );
                      },
                      icon: Icon(
                        Icons.gavel_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ), */
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showMoveToPeDialog(
    final BuildContext context,
    final VehicleLongDto vehicle,
  ) {
    final isInPe = vehicle.type == VehicleType.inPe;
    showDialog(
      context: context,
      builder: (final context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              content: Column(
                children: [
                  Text(
                    isInPe
                        ? AppLocalizations.of(context).remove_from_p_and_e
                        : AppLocalizations.of(context).add_to_p_and_e,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: Text(AppLocalizations.of(context).no),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          getIt<VehicleDetailBloc>()
                              .add(SetVehicleTypeEvent(vehicle.id, isInPe ? VehicleType.collection : VehicleType.inPe));
                          context.router.pop();
                        },
                        child: Text(AppLocalizations.of(context).yes),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void alertDialogArchive(final BuildContext context, final VehicleLongDto vehicle) {
    showDialog(
      context: context,
      builder: (final context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              content: Column(
                children: [
                  Text(AppLocalizations.of(context).you_adding_car_in_archive),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: Text(AppLocalizations.of(context).no),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          getIt<VehicleDetailBloc>().add(DeleteVehicleEvent(vehicle.id));
                          context.router.pop();
                          context.router.navigate(const Communication_ScreenRoute());
                        },
                        child: Text(AppLocalizations.of(context).yes),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
