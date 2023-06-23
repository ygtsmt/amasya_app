import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_form/bloc/vehicle_cost_form_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/bloc/vehicle_cost_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/data/models/vehicle_cost_list_short_dto.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleCostFormScreen extends StatefulWidget {
  const VehicleCostFormScreen({
    required this.vehicleId,
    super.key,
    this.vehicleCost,
  });

  final int vehicleId;
  final VehicleCostListShortDto? vehicleCost;
  bool get isEditMode => vehicleCost != null;

  @override
  State<VehicleCostFormScreen> createState() => _VehicleCostFormScreenState();
}

class _VehicleCostFormScreenState extends State<VehicleCostFormScreen> {
  late final TextEditingController _maintenanceCostNameController;
  late final TextEditingController _maintenanceCostPriceController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _maintenanceCostNameController = TextEditingController(text: widget.vehicleCost?.name);
    _maintenanceCostPriceController = TextEditingController(text: widget.vehicleCost?.price.toString());
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<VehicleCostFormBloc, VehicleCostFormState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          getIt<VehicleCostListBloc>().add(GetVehicleCostListEvent(widget.vehicleId));
          context.router.pop();
        }
      },
      builder: (final context, final state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  RevoScreenHeader(
                    title: widget.isEditMode == true
                        ? AppLocalizations.of(context).edit_maintenance_cost
                        : AppLocalizations.of(context).create_maintenance_cost,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _maintenanceCostNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).name,
                          ),
                          maxLines: null,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: AppLocalizations.current.empty_error,
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: _maintenanceCostPriceController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).cost,
                            suffixText: AppLocalizations.of(context).chf,
                          ),
                          validator: RequiredValidator(
                            errorText: AppLocalizations.current.empty_error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: FilledButton(
                    onPressed: state.status == EventStatus.processing
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              if (widget.isEditMode) {
                                final price = double.parse(_maintenanceCostPriceController.text);
                                getIt<VehicleCostFormBloc>().add(
                                  UpdateVehicleCostEvent(
                                    VehicleCostListShortDto(
                                      id: widget.vehicleCost!.id,
                                      name: _maintenanceCostNameController.text,
                                      price: price,
                                    ),
                                  ),
                                );
                              } else {
                                final price = double.parse(_maintenanceCostPriceController.text);
                                getIt<VehicleCostFormBloc>().add(
                                  CreateVehicleCostEvent(
                                    vehicleId: widget.vehicleId,
                                    name: _maintenanceCostNameController.text,
                                    price: price,
                                  ),
                                );
                              }
                            }
                          },
                    child: state.status == EventStatus.processing
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : Text(AppLocalizations.of(context).save),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (widget.isEditMode)
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        getIt<VehicleCostFormBloc>().add(DeleteVehicleCostEvent(vehicleCostId: widget.vehicleCost!.id));
                      },
                      label: Text(
                        AppLocalizations.of(context).delete.toUpperCase(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
