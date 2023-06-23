import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/ui/vehicle_list_item_widget.dart";
import "package:revogarageapp/app/features/profile/features/vehicle_archive_list/bloc/vehicle_archive_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleArchiveListScreen extends StatefulWidget {
  const VehicleArchiveListScreen({super.key});

  @override
  State<VehicleArchiveListScreen> createState() => _VehicleArchiveListScreenState();
}

class _VehicleArchiveListScreenState extends State<VehicleArchiveListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<VehicleArchiveListBloc>().add(const GetVehicleArchiveListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).vehicleArchive,
              actions: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.current.search,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                  ),
                ),
                onChanged: (final text) {
                  if (text.isEmpty) {
                    getIt<VehicleArchiveListBloc>().add(const GetVehicleArchiveListEvent());
                  } else {
                    getIt<VehicleArchiveListBloc>().add(SearchVehicleArchiveEvent(text));
                  }
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<VehicleArchiveListBloc, VehicleArchiveListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.vehicleArchives.length,
                    itemBuilder: (final context, final index) {
                      final vehicle = state.vehicleArchives[index];
                      return GestureDetector(
                        onTap: () {
                          vehicleArchiveListAlert(vehicle.id);
                        },
                        child: VehicleListItemWidget(
                          vehicle: vehicle,
                          isPressable: false,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void vehicleArchiveListAlert(
    final int vehicleId,
  ) {
    showDialog(
      context: context,
      builder: (final context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              content: Column(
                children: [
                  Text(AppLocalizations.of(context).do_you_want_to_remove_this_vehicle_from_archive),
                  const SizedBox(
                    height: 14,
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
                          context.router.pop();
                          getIt<VehicleArchiveListBloc>().add(SetVehicleArchiveEvent(id: vehicleId));
                        },
                        child: Text(AppLocalizations.of(context).yes),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
