import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:revogarageapp/core/models/drop_down_form_model.dart";
import "package:revogarageapp/generated/l10n.dart";

final vehicleBrand = [
  DropDownModel(1, "Bmw"),
  DropDownModel(2, "Mercedes"),
  DropDownModel(3, "Ford"),
  DropDownModel(4, "Fiat"),
  DropDownModel(5, "Renault"),
];

class PeVehicleFilterSheet extends StatelessWidget {
  const PeVehicleFilterSheet({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear_all_outlined),
              ),
              Text(
                AppLocalizations.of(context).filter,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: <Widget>[
              Text(AppLocalizations.of(context).occupied),
              const Spacer(),
              const Switch(
                value: false,
                onChanged: null,
              ),
            ],
          ),
          DropdownButtonFormField<int>(
            hint: Text(AppLocalizations.of(context).select_brand),
            items: vehicleBrand
                .map(
                  (final brand) => DropdownMenuItem(
                    value: brand.id,
                    child: Text(brand.name),
                  ),
                )
                .toList(),
            onChanged: (final _) {},
          ),
          DropdownButtonFormField<int>(
            hint: Text(AppLocalizations.of(context).select_color),
            items: vehicleBrand
                .map(
                  (final brand) => DropdownMenuItem(
                    value: brand.id,
                    child: Text(brand.name),
                  ),
                )
                .toList(),
            onChanged: (final _) {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: FilledButton.icon(
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(Icons.search),
              label: Text(AppLocalizations.of(context).search),
            ),
          ),
        ],
      ),
    );
  }
}
