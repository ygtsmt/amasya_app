import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_basic_form/bloc/vehicle_basic_form_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_services_screen/ui/vehicle_services_break_front_break_rear_form/vehicle_services_break_front_break_rear_form.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_services_screen/ui/vehicle_services_control_light_form/vehicle_services_control_light_form.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_services_screen/ui/vehicle_services_engine_oil_leak_form/vehicle_services_engine_oil_leak_form.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_services_screen/ui/vehicle_services_mfk_form/vehicle_services_mfk_form.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_services_screen/ui/vehicle_services_services_form/vehicle_services_form.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleServicesScreen extends StatefulWidget {
  const VehicleServicesScreen({required this.vehicle, super.key});

  final VehicleLongDto vehicle;

  @override
  State<VehicleServicesScreen> createState() => _VehicleServicesScreenState();
}

class _VehicleServicesScreenState extends State<VehicleServicesScreen> {
  late VehicleLongDto vehicleState;

  @override
  void initState() {
    super.initState();
    vehicleState = widget.vehicle;
  }

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          child: Column(
            children: [
              RevoScreenHeader(title: AppLocalizations.of(context).vehicle_service),
              VehicleServicesForm(
                vehicle: vehicleState,
                onChange: (final VehicleLongDto vehicle) {
                  setState(() {
                    vehicleState = vehicle;
                  });
                },
              ),
              VehicleServicesMfkFormScreen(
                vehicle: vehicleState,
                onChange: (final VehicleLongDto vehicle) {
                  setState(() {
                    vehicleState = vehicle;
                  });
                },
              ),
              VehicleServicesBreakFrontBreakRearFormScreen(
                vehicle: vehicleState,
                onChange: (final VehicleLongDto vehicle) {
                  setState(() {
                    vehicleState = vehicle;
                  });
                },
              ),
              VehicleServicesEngineOilLeakFormScreen(
                vehicle: vehicleState,
                onChange: (final VehicleLongDto vehicle) {
                  setState(() {
                    vehicleState = vehicle;
                  });
                },
              ),
              VehicleServicesControlLightFormScreen(
                vehicle: vehicleState,
                onChange: (final VehicleLongDto vehicle) {
                  setState(() {
                    vehicleState = vehicle;
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    getIt<VehicleBasicFormBloc>().add(
                      UpdateVehicleEvent(
                        vehicle: vehicleState,
                      ),
                    );
                    context.router.pop();
                  },
                  child: Text(AppLocalizations.of(context).save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
