import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/bloc/vehicle_tire_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/data/models/vehicle_tire_detail_dto.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleTireDetailsSummerTireForm extends StatefulWidget {
  const VehicleTireDetailsSummerTireForm({
    required this.vehicleId,
    required this.tire,
    super.key,
  });

  final int vehicleId;
  final VehicleTireDetailDto tire;
  @override
  State<VehicleTireDetailsSummerTireForm> createState() => _VehicleTireDetailsSummerTireForm();
}

class _VehicleTireDetailsSummerTireForm extends State<VehicleTireDetailsSummerTireForm> {
  late final TextEditingController _frontDimensionsController;
  late final TextEditingController _rearDimensionsController;
  late final TextEditingController _profileFrontController;
  late final TextEditingController _profileRearController;

  int? frontBrandId;
  int? frontRimsId;

  int? rearBrandId;
  int? rearRimsId;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _frontDimensionsController = TextEditingController(text: widget.tire.frontDimention);
    _rearDimensionsController = TextEditingController(text: widget.tire.rearDimention);
    _profileFrontController = TextEditingController(text: widget.tire.frontRimProfile);
    _profileRearController = TextEditingController(text: widget.tire.rearRimProfile);

    setState(() {
      frontBrandId = widget.tire.frontTireBrandId;
      frontRimsId = widget.tire.frontTireRimId;

      rearBrandId = widget.tire.rearTireBrandId;
      rearRimsId = widget.tire.rearTireRimId;
    });
  }

  @override
  void dispose() {
    _frontDimensionsController.dispose();
    _rearDimensionsController.dispose();
    _profileFrontController.dispose();
    _profileRearController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<VehicleTireBloc, VehicleTireState>(
      builder: (final context, final state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).front,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      DropdownButtonFormField<int>(
                        hint: Text(AppLocalizations.of(context).tire_brand),
                        value: frontBrandId,
                        items: state.tireBrands
                            ?.map(
                              (final brand) => DropdownMenuItem(
                                value: brand.id,
                                child: Text(brand.name),
                              ),
                            )
                            .toList(),
                        onChanged: (final value) {
                          setState(() {
                            frontBrandId = value;
                          });
                        },
                        validator: (final value) {
                          if (value == null) {
                            return AppLocalizations.of(context).empty_error;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _frontDimensionsController,
                        decoration: InputDecoration(labelText: AppLocalizations.of(context).dimensions),
                        keyboardType: TextInputType.text,
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: AppLocalizations.current.empty_error),
                          ],
                        ),
                      ),
                      DropdownButtonFormField<int>(
                        hint: Text(AppLocalizations.of(context).rims),
                        value: frontRimsId,
                        items: state.tireRims
                            ?.map(
                              (final rims) => DropdownMenuItem(
                                value: rims.id,
                                child: Text(rims.name),
                              ),
                            )
                            .toList(),
                        onChanged: (final value) {
                          setState(() {
                            frontRimsId = value;
                          });
                        },
                        validator: (final value) {
                          if (value == null) {
                            return AppLocalizations.of(context).empty_error;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _profileFrontController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).profile_front,
                        ),
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: AppLocalizations.current.empty_error),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).rear,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      DropdownButtonFormField<int>(
                        hint: Text(AppLocalizations.of(context).tire_brand),
                        value: rearBrandId,
                        items: state.tireBrands
                            ?.map(
                              (final brand) => DropdownMenuItem(
                                value: brand.id,
                                child: Text(brand.name),
                              ),
                            )
                            .toList(),
                        onChanged: (final value) {
                          setState(() {
                            rearBrandId = value;
                          });
                        },
                        validator: (final value) {
                          if (value == null) {
                            return AppLocalizations.of(context).empty_error;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _rearDimensionsController,
                        decoration: InputDecoration(labelText: AppLocalizations.of(context).dimensions),
                        keyboardType: TextInputType.text,
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: AppLocalizations.current.empty_error),
                          ],
                        ),
                      ),
                      DropdownButtonFormField<int>(
                        hint: Text(AppLocalizations.of(context).rims),
                        value: rearRimsId,
                        items: state.tireRims
                            ?.map(
                              (final rims) => DropdownMenuItem(
                                value: rims.id,
                                child: Text(rims.name),
                              ),
                            )
                            .toList(),
                        onChanged: (final value) {
                          setState(() {
                            rearRimsId = value;
                          });
                        },
                        validator: (final value) {
                          if (value == null) {
                            return AppLocalizations.of(context).empty_error;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _profileRearController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).profile_front,
                        ),
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: AppLocalizations.current.empty_error),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.tire.id == 0) {
                          getIt<VehicleTireBloc>().add(
                            AddTireEvent(
                              widget.vehicleId,
                              widget.tire.copyWith(
                                frontTireBrandId: frontBrandId,
                                frontTireRimId: frontRimsId,
                                frontDimention: _frontDimensionsController.text,
                                frontRimProfile: _profileFrontController.text,
                                rearTireBrandId: rearBrandId,
                                rearTireRimId: rearRimsId,
                                rearDimention: _rearDimensionsController.text,
                                rearRimProfile: _profileRearController.text,
                              ),
                            ),
                          );
                        } else {
                          getIt<VehicleTireBloc>().add(
                            UpdateTireEvent(
                              widget.vehicleId,
                              widget.tire.copyWith(
                                frontTireBrandId: frontBrandId,
                                frontTireRimId: frontRimsId,
                                frontDimention: _frontDimensionsController.text,
                                frontRimProfile: _profileFrontController.text,
                                rearTireBrandId: rearBrandId,
                                rearTireRimId: rearRimsId,
                                rearDimention: _rearDimensionsController.text,
                                rearRimProfile: _profileRearController.text,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(AppLocalizations.of(context).save),
                  ),
                ),
                if (widget.tire.id != 0)
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          debugPrint(widget.tire.id.toString());
                          getIt<VehicleTireBloc>().add(DeleteTireEvent(tireId: widget.tire.id));
                          context.router.pop();
                        },
                        label: Text(
                          AppLocalizations.of(context).delete.toUpperCase(),
                        ),
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
