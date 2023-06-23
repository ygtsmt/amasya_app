import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/ui/vehicle_list_item_widget.dart";
import "package:revogarageapp/app/features/pe/features/pe_vehicle_list/bloc/pe_vehicle_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class PeVehicleListScreen extends StatefulWidget {
  const PeVehicleListScreen({super.key});

  @override
  State<PeVehicleListScreen> createState() => _PeVehicleListScreenState();
}

class _PeVehicleListScreenState extends State<PeVehicleListScreen> {
  @override
  void initState() {
    getIt<PeVehicleListBloc>().add(GetPeVehicleListEvent());
    super.initState();
  }

  // final bool _switchValue = false;
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        RevoScreenHeader(
          title: AppLocalizations.of(context).pande_vehicles,
          actions: TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.current.search,
              prefixIcon: const Icon(
                Icons.search_outlined,
              ),
            ),
            onChanged: (final text) {
              if (text.isEmpty) {
                getIt<PeVehicleListBloc>().add(GetPeVehicleListEvent());
              } else {
                getIt<PeVehicleListBloc>().add(SearchVehicleListEvent(text));
              }
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<PeVehicleListBloc, PeVehicleListState>(
            builder: (final context, final state) {
              return ListView.builder(
                itemCount: state.vehicle.length,
                itemBuilder: (final BuildContext context, final int index) {
                  return VehicleListItemWidget(
                    isPressable: false,
                    vehicle: state.vehicle[index],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
