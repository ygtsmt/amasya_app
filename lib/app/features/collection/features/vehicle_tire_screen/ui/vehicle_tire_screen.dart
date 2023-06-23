import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/bloc/vehicle_tire_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/data/models/vehicle_tire_detail_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/ui/vehicle_tire_details_summer_tire_form/vehicle_tire_details_summer_tire_form.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleTireScreen extends StatefulWidget {
  const VehicleTireScreen({
    required this.vehicleId,
    super.key,
  });

  final int vehicleId;

  @override
  State<VehicleTireScreen> createState() => _VehicleTireScreenState();
}

class _VehicleTireScreenState extends State<VehicleTireScreen> with SingleTickerProviderStateMixin {
  late VehicleTireDetailDto summerTire;
  late VehicleTireDetailDto winterTire;
  late VehicleTireDetailDto allSeasonTire;

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    getIt<VehicleTireBloc>().add(GetTireBrands());
    getIt<VehicleTireBloc>().add(GetTireRims());
    getIt<VehicleTireBloc>().add(GetTiresEvent(widget.vehicleId));

    summerTire = const VehicleTireDetailDto(vehicleTireType: VehicleTireType.summer);
    winterTire = const VehicleTireDetailDto(vehicleTireType: VehicleTireType.winter);
    allSeasonTire = const VehicleTireDetailDto(vehicleTireType: VehicleTireType.allSeason);
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<VehicleTireBloc, VehicleTireState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          if (state.tires != null) {
            summerTire = state.tires!.firstWhere(
              (final element) => element.vehicleTireType == VehicleTireType.summer,
              orElse: () => const VehicleTireDetailDto(
                vehicleTireType: VehicleTireType.summer,
              ),
            );
            winterTire = state.tires!.firstWhere(
              (final element) => element.vehicleTireType == VehicleTireType.winter,
              orElse: () => const VehicleTireDetailDto(
                vehicleTireType: VehicleTireType.winter,
              ),
            );
            allSeasonTire = state.tires!.firstWhere(
              (final element) => element.vehicleTireType == VehicleTireType.allSeason,
              orElse: () => const VehicleTireDetailDto(
                vehicleTireType: VehicleTireType.allSeason,
              ),
            );
          }
        }
      },
      builder: (final context, final state) {
        if (state.status == EventStatus.processing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == EventStatus.failure) {
          return Center(
            child: Text(AppLocalizations.of(context).common_error),
          );
        } else if (state.status == EventStatus.idle) {
          return Container();
        }

        return Column(
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(
                  icon: const Icon(
                    Icons.sunny,
                  ),
                  text: AppLocalizations.of(context).summer,
                ),
                Tab(
                  icon: const Icon(
                    Icons.ac_unit,
                  ),
                  text: AppLocalizations.of(context).winter,
                ),
                Tab(
                  icon: const Icon(
                    Icons.all_inclusive,
                  ),
                  text: AppLocalizations.of(context).all_seasons,
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  VehicleTireDetailsSummerTireForm(
                    key: const Key("summerTire"),
                    vehicleId: widget.vehicleId,
                    tire: summerTire,
                  ),
                  VehicleTireDetailsSummerTireForm(
                    key: const Key("winterTire"),
                    vehicleId: widget.vehicleId,
                    tire: winterTire,
                  ),
                  VehicleTireDetailsSummerTireForm(
                    key: const Key("allSeasonTire"),
                    vehicleId: widget.vehicleId,
                    tire: allSeasonTire,
                  ),
                ],
              ),
            ),
          ],
        );

        // return SingleChildScrollView(
        //   child: Form(
        //     child: Column(
        //       children: [
        //         RevoScreenHeader(title: AppLocalizations.of(context).vehicle_tire),
        //         VehicleTireDetailsSummerTireForm(
        //           tire: summerTire,
        //           onChange: (final p0) {
        //             summerTire = p0;
        //           },
        //         ),
        //         const SizedBox(
        //           height: 12,
        //         ),
        //         VehicleTireDetailsSummerTireForm(
        //           tire: winterTire,
        //           onChange: (final p0) {
        //             winterTire = p0;
        //           },
        //         ),
        //         const SizedBox(
        //           height: 12,
        //         ),
        //         VehicleTireDetailsSummerTireForm(
        //           tire: allSeasonTire,
        //           onChange: (final p0) {
        //             allSeasonTire = p0;
        //           },
        //         ),
        //         const SizedBox(
        //           height: 12,
        //         ),
        //         SizedBox(
        //           width: double.infinity,
        //           child: FilledButton(
        //             onPressed: () {
        //               if (summerTire.frontTireBrandId != null) {
        //                 if (summerTire.id == 0) {
        //                   getIt<VehicleTireBloc>().add(AddTireEvent(widget.vehicleId, summerTire));
        //                 } else {
        //                   getIt<VehicleTireBloc>().add(UpdateTireEvent(widget.vehicleId, summerTire));
        //                 }
        //               }

        //               // if (winterTire.id == 0) {
        //               //   getIt<VehicleTireBloc>().add(AddTireEvent(widget.vehicleId, winterTire));
        //               // } else {
        //               //   getIt<VehicleTireBloc>().add(UpdateTireEvent(widget.vehicleId, winterTire));
        //               // }

        //               // if (allSeasonTire.id == 0) {
        //               //   getIt<VehicleTireBloc>().add(AddTireEvent(widget.vehicleId, allSeasonTire));
        //               // } else {
        //               //   getIt<VehicleTireBloc>().add(UpdateTireEvent(widget.vehicleId, allSeasonTire));
        //               // }

        //               context.router.pop();
        //             },
        //             child: Text(AppLocalizations.of(context).submit_button),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}
