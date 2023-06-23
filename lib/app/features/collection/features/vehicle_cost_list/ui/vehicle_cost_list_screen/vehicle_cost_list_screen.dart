import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/bloc/vehicle_cost_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleCostListScreen extends StatefulWidget {
  const VehicleCostListScreen({
    required this.vehicleId,
    super.key,
  });
  final int vehicleId;
  @override
  State<VehicleCostListScreen> createState() => _VehicleCostListScreenState();
}

class _VehicleCostListScreenState extends State<VehicleCostListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<VehicleCostListBloc>().add(GetVehicleCostListEvent(widget.vehicleId));
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).maintenance_costs,
            ),
            Expanded(
              child: BlocBuilder<VehicleCostListBloc, VehicleCostListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.vehicleCostList.length,
                    itemBuilder: (final context, final index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.router.navigate(
                              VehicleCostFormScreenRoute(
                                vehicleId: widget.vehicleId,
                                vehicleCost: state.vehicleCostList[index],
                              ),
                            );
                          },
                          visualDensity: VisualDensity.comfortable,
                          title: Row(
                            children: [
                              Text(
                                "${state.vehicleCostList[index].name} - ",
                              ),
                              Text(
                                "${state.vehicleCostList[index].price}  ${AppLocalizations.of(context).chf}",
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FloatingActionButton(
            onPressed: () {
              context.router.navigate(VehicleCostFormScreenRoute(vehicleId: widget.vehicleId));
            },
            child: const Icon(Icons.add_outlined),
          ),
        )
      ],
    );
  }
}
