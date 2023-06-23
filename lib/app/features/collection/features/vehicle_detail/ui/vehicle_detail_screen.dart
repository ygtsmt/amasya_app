import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/bloc/vehicle_cost_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/bloc/vehicle_damage_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/bloc/bloc/vehicle_detail_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_cost_summary_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/ui/components/components.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_photo/bloc/vehicle_photo_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleDetailScreen extends StatefulWidget {
  const VehicleDetailScreen({
    required this.vehicleId,
    super.key,
  });
  final int vehicleId;

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {
  @override
  void initState() {
    super.initState();
    getIt<VehicleDetailBloc>().add(GetVehicleDetailEvent(widget.vehicleId));
    getIt<VehicleDamageListBloc>().add(GetVehicleDamageListEvent(widget.vehicleId));
    getIt<VehicleCostListBloc>().add(GetVehicleCostListEvent(widget.vehicleId));
    getIt<VehiclePhotoBloc>().add(GetVehiclePhotosEvent(vehicleId: widget.vehicleId));
  }

  List<VehicleCostSummary> damageCosts = [];
  List<VehicleCostSummary> customCost = [];
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<VehicleDetailBloc, VehicleDetailState>(
      builder: (final context, final state) {
        if (state.getVehicleDetailStatus == EventStatus.processing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.getVehicleDetailStatus == EventStatus.failure) {
          return Center(
            child: Text(AppLocalizations.of(context).common_error),
          );
        } else if (state.getVehicleDetailStatus == EventStatus.idle) {
          return Container();
        }

        double total = damageCosts.fold(0, (final previous, final current) => previous + current.amount);
        total += customCost.fold(0, (final previous, final current) => previous + current.amount);
        total += state.vehicleLongDto?.serviceTypePrice ?? 0;
        total += state.vehicleLongDto?.mfk_Price ?? 0;
        total += state.vehicleLongDto?.priceBreaksFront ?? 0;
        total += state.vehicleLongDto?.priceBreaksRear ?? 0;
        total += state.vehicleLongDto?.priceEngineOilLeak ?? 0;
        total += state.vehicleLongDto?.priceControlLight ?? 0;

        return BlocListener<VehicleCostListBloc, VehicleCostListState>(
          listener: (final context, final state) {
            setState(() {
              customCost =
                  state.vehicleCostList.map((final e) => VehicleCostSummary(amount: e.price, text: e.name)).toList();
            });
          },
          child: BlocListener<VehicleDamageListBloc, VehicleDamageListState>(
            listener: (final context, final state) {
              setState(() {
                damageCosts =
                    state.damageList.map((final e) => VehicleCostSummary(amount: e.price, text: e.name)).toList();
              });
            },
            child: Column(
              children: <Widget>[
                RevoScreenHeader(
                  title: AppLocalizations.of(context).vehicle_details,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children: [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 4,
                              mainAxisCellCount: 2,
                              child: VehicleSummaryCard(
                                vehicle: state.vehicleLongDto!,
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 4,
                              mainAxisCellCount: 1,
                              child: VehicleDetailCardButton(
                                title: AppLocalizations.of(context).basic_details,
                                onTap: () {
                                  context.router.push(
                                    VehicleBasicDetailsScreenRoute(
                                      vehicle: state.vehicleLongDto,
                                    ),
                                  );
                                },
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: VehicleDetailCardButton(
                                title: AppLocalizations.of(context).photos,
                                onTap: () {
                                  context.router.push(VehiclePhotoScreenRoute(vehicleId: widget.vehicleId)).then(
                                        (final value) => {
                                          getIt<VehicleDetailBloc>().add(GetVehicleDetailEvent(widget.vehicleId)),
                                        },
                                      );
                                },
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: VehicleDetailCardButton(
                                title: AppLocalizations.of(context).services,
                                onTap: () {
                                  context.router.push(VehicleServicesScreenRoute(vehicle: state.vehicleLongDto!)).then(
                                        (final value) => {
                                          getIt<VehicleDetailBloc>().add(GetVehicleDetailEvent(widget.vehicleId)),
                                        },
                                      );
                                },
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: VehicleDetailCardButton(
                                title: AppLocalizations.of(context).damage_details,
                                onTap: () {
                                  context.router
                                      .push(VehicleDamageListScreenRoute(vehicleId: widget.vehicleId))
                                      .then((final value) {
                                    getIt<VehicleDetailBloc>().add(GetVehicleDetailEvent(widget.vehicleId));
                                  });
                                },
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: VehicleDetailCardButton(
                                title: AppLocalizations.of(context).tire_details,
                                onTap: () {
                                  context.router
                                      .push(VehicleTireScreenRoute(vehicleId: widget.vehicleId))
                                      .then((final value) {
                                    getIt<VehicleDetailBloc>().add(GetVehicleDetailEvent(widget.vehicleId));
                                  });
                                },
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 4,
                              mainAxisCellCount: 1,
                              child: VehicleDetailCardButton(
                                title: AppLocalizations.of(context).maintenance_costs,
                                onTap: () {
                                  context.router
                                      .push(VehicleCostListScreenRoute(vehicleId: widget.vehicleId))
                                      .then((final value) {
                                    getIt<VehicleCostListBloc>().add(GetVehicleCostListEvent(widget.vehicleId));
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (total > 0)
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: <Widget>[
                                  if ((state.vehicleLongDto?.serviceTypePrice ?? 0) > 0)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              AppLocalizations.of(context).service,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${state.vehicleLongDto?.serviceTypePrice}  ${AppLocalizations.of(context).chf}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                      ],
                                    ),
                                  if ((state.vehicleLongDto?.mfk_Price ?? 0) > 0)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              AppLocalizations.of(context).mfk,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${state.vehicleLongDto?.mfk_Price}  ${AppLocalizations.of(context).chf}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                      ],
                                    ),
                                  if ((state.vehicleLongDto?.priceBreaksFront ?? 0) > 0)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              AppLocalizations.of(context).break_front,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${state.vehicleLongDto?.priceBreaksFront}  ${AppLocalizations.of(context).chf}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                      ],
                                    ),
                                  if ((state.vehicleLongDto?.priceBreaksRear ?? 0) > 0)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              AppLocalizations.of(context).break_rear,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${state.vehicleLongDto?.priceBreaksRear}  ${AppLocalizations.of(context).chf}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                      ],
                                    ),
                                  if ((state.vehicleLongDto?.priceEngineOilLeak ?? 0) > 0)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              AppLocalizations.of(context).engine_oil_leak,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${state.vehicleLongDto?.priceEngineOilLeak}  ${AppLocalizations.of(context).chf}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                      ],
                                    ),
                                  if ((state.vehicleLongDto?.priceControlLight ?? 0) > 0)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              AppLocalizations.of(context).control_light,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${state.vehicleLongDto?.priceControlLight}  ${AppLocalizations.of(context).chf}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                      ],
                                    ),
                                  for (final cost in damageCosts)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              cost.text,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${cost.amount}  ${AppLocalizations.of(context).chf}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                  for (final cost in customCost)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              cost.text,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${cost.amount}  ${AppLocalizations.of(context).chf}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        AppLocalizations.of(context).total,
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      Text(
                                        "$total  ${AppLocalizations.of(context).chf}",
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
