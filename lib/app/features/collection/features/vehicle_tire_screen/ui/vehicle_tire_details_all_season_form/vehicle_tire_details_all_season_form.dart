import "package:flutter/material.dart";
import "package:revogarageapp/core/models/drop_down_form_model.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleTireDetailsAllSeasonTireForm extends StatefulWidget {
  const VehicleTireDetailsAllSeasonTireForm({super.key});

  @override
  State<VehicleTireDetailsAllSeasonTireForm> createState() => _VehicleTireDetailsAllSeasonTireForm();
}

class _VehicleTireDetailsAllSeasonTireForm extends State<VehicleTireDetailsAllSeasonTireForm> {
  late final TextEditingController _allSeasonsFrontDimensionsController;
  late final TextEditingController _allSeasonsRearDimensionsController;
  late final TextEditingController _allSeasonsProfileFrontController;
  late final TextEditingController _allSeasonsProfileRearController;

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
    _allSeasonsFrontDimensionsController = TextEditingController();
    _allSeasonsRearDimensionsController = TextEditingController();
    _allSeasonsProfileFrontController = TextEditingController();
    _allSeasonsProfileRearController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Icon(Icons.deblur),
            const SizedBox(
              height: 4,
            ),
            Text(AppLocalizations.of(context).all_seasons),
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
                    controller: _allSeasonsFrontDimensionsController,
                    decoration: InputDecoration(labelText: AppLocalizations.of(context).dimensions),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _allSeasonsRearDimensionsController,
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
                    controller: _allSeasonsProfileFrontController,
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
                    controller: _allSeasonsProfileRearController,
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
