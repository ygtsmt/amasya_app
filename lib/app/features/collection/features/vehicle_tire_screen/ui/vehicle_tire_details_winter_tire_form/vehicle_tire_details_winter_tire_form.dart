import "package:flutter/material.dart";
import "package:revogarageapp/core/models/drop_down_form_model.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleTireDetailsWinterTireForm extends StatefulWidget {
  const VehicleTireDetailsWinterTireForm({super.key});

  @override
  State<VehicleTireDetailsWinterTireForm> createState() => _VehicleTireDetailsWinterTireForm();
}

class _VehicleTireDetailsWinterTireForm extends State<VehicleTireDetailsWinterTireForm> {
  late final TextEditingController _winterFrontDimensionsController;
  late final TextEditingController _winterRearDimensionsController;
  late final TextEditingController _winterProfileFrontController;
  late final TextEditingController _winterProfileRearController;

  int? tireBrandId;
  final tireBrand = [
    DropDownModel(1, "Continental"),
    DropDownModel(2, "Michelin"),
    DropDownModel(3, "Bridgestone"),
  ];
  int? rimsId;
  final rims = [
    DropDownModel(1, "Steel"),
    DropDownModel(2, "Metal"),
    DropDownModel(3, "Aluminum"),
  ];
  @override
  void initState() {
    super.initState();
    _winterFrontDimensionsController = TextEditingController();
    _winterRearDimensionsController = TextEditingController();
    _winterProfileFrontController = TextEditingController();
    _winterProfileRearController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Icon(Icons.ac_unit_outlined),
            const SizedBox(
              height: 4,
            ),
            Text(AppLocalizations.of(context).winter_tire),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(AppLocalizations.of(context).tire_front),
                Text(AppLocalizations.of(context).tire_rear),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    hint: Text(AppLocalizations.of(context).tire_brand),
                    items: tireBrand
                        .map(
                          (final brand) => DropdownMenuItem(
                            value: brand.id,
                            child: Text(brand.name),
                          ),
                        )
                        .toList(),
                    onChanged: (final value) {
                      setState(
                        () {
                          tireBrandId = value;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    hint: Text(AppLocalizations.of(context).tire_brand),
                    items: tireBrand
                        .map(
                          (final brand) => DropdownMenuItem(
                            value: brand.id,
                            child: Text(brand.name),
                          ),
                        )
                        .toList(),
                    onChanged: (final value) {
                      setState(
                        () {
                          tireBrandId = value;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _winterFrontDimensionsController,
                    decoration: InputDecoration(labelText: AppLocalizations.of(context).dimensions),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _winterRearDimensionsController,
                    decoration: InputDecoration(labelText: AppLocalizations.of(context).dimensions),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            DropdownButtonFormField<int>(
              hint: Text(AppLocalizations.of(context).rims),
              items: rims
                  .map(
                    (final rims) => DropdownMenuItem(
                      value: rims.id,
                      child: Text(rims.name),
                    ),
                  )
                  .toList(),
              onChanged: (final value) {
                setState(
                  () {
                    rimsId = value;
                  },
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _winterProfileFrontController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).profile_front,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _winterProfileRearController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).profile_rear,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
