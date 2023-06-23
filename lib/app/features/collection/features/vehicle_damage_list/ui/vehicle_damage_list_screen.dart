import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/bloc/vehicle_damage_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/routes.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleDamageListScreen extends StatefulWidget {
  const VehicleDamageListScreen({
    required this.vehicleId,
    super.key,
  });

  final int vehicleId;

  @override
  State<VehicleDamageListScreen> createState() => _VehicleDamageListScreenState();
}

class _VehicleDamageListScreenState extends State<VehicleDamageListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<VehicleDamageListBloc>().add(GetVehicleDamageListEvent(widget.vehicleId));
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        RevoScreenHeader(
          title: AppLocalizations.of(context).damage,
          actions: TextField(
            onChanged: (final value) {
              if (value.isEmpty) {
                getIt<VehicleDamageListBloc>().add(GetVehicleDamageListEvent(widget.vehicleId));
              } else {
                getIt<VehicleDamageListBloc>().add(SearchDamageListEvent(value));
              }
            },
            decoration: InputDecoration(
              hintText: AppLocalizations.current.search,
              prefixIcon: const Icon(
                Icons.search_outlined,
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<VehicleDamageListBloc, VehicleDamageListState>(
            builder: (final context, final state) {
              return ListView.builder(
                itemCount: state.damageList.length,
                itemBuilder: (final context, final index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        context.router.navigate(
                          VehicleDamageScreenRoute(damageId: state.damageList[index].id, vehicleId: widget.vehicleId),
                        );
                      },
                      visualDensity: VisualDensity.comfortable,
                      title: Text(state.damageList[index].name),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: FloatingActionButton(
              onPressed: () {
                context.router.navigate(VehicleDamageScreenRoute(vehicleId: widget.vehicleId));
              },
              child: const Icon(Icons.add_outlined),
            ),
          ),
        )
      ],
    );
  }
}
