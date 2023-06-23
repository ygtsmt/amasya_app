import "package:currency_text_input_formatter/currency_text_input_formatter.dart";
import "package:flutter/material.dart";
import "package:group_button/group_button.dart";
import "package:intl/intl.dart" as intl;
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleServicesControlLightFormScreen extends StatefulWidget {
  const VehicleServicesControlLightFormScreen({required this.vehicle, required this.onChange, super.key});

  final VehicleLongDto vehicle;
  final Function(VehicleLongDto) onChange;
  @override
  State<VehicleServicesControlLightFormScreen> createState() => _VehicleServicesControlLightFormScreen();
}

class _VehicleServicesControlLightFormScreen extends State<VehicleServicesControlLightFormScreen> {
  late final GroupButtonController _groupButtonController;
  late final TextEditingController _priceController;
  @override
  void initState() {
    super.initState();

    _groupButtonController = GroupButtonController();
    _priceController = TextEditingController(text: widget.vehicle.priceControlLight?.toString() ?? "");
    if (widget.vehicle.controlLight != null) {
      _groupButtonController.selectIndex(widget.vehicle.controlLight! ? 1 : 0);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).control_light,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(),
            const SizedBox(height: 16),
            GroupButton(
              controller: _groupButtonController,
              buttons: [
                AppLocalizations.of(context).no,
                AppLocalizations.of(context).yes,
              ],
              options: GroupButtonOptions(
                groupingType: GroupingType.row,
                mainGroupAlignment: MainGroupAlignment.spaceBetween,
                unselectedColor: Theme.of(context).colorScheme.secondaryContainer,
              ),
              onSelected: (final String val, final int index, final bool isSelected) {
                setState(() {
                  widget.onChange(
                    widget.vehicle.copyWith(
                      controlLight: index > 0,
                      priceControlLight: index == 0 ? 0 : widget.vehicle.priceControlLight,
                    ),
                  );
                });
              },
            ),
            Visibility(
              visible: (_groupButtonController.selectedIndex ?? 0) > 0,
              child: TextField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).price,
                  suffixText: AppLocalizations.of(context).chf,
                ),
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    decimalDigits: 0,
                    symbol: "",
                  )
                ],
                keyboardType: TextInputType.number,
                controller: _priceController,
                onChanged: (final val) {
                  widget.onChange(
                    widget.vehicle.copyWith(
                      priceControlLight: val.isEmpty ? null : intl.NumberFormat().parse(val).toDouble(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
