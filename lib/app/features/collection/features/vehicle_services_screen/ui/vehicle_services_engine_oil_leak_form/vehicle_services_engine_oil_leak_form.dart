import "package:currency_text_input_formatter/currency_text_input_formatter.dart";
import "package:flutter/material.dart";
import "package:group_button/group_button.dart";
import "package:intl/intl.dart" as intl;
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleServicesEngineOilLeakFormScreen extends StatefulWidget {
  const VehicleServicesEngineOilLeakFormScreen({required this.vehicle, required this.onChange, super.key});

  final VehicleLongDto vehicle;
  final Function(VehicleLongDto) onChange;

  @override
  State<VehicleServicesEngineOilLeakFormScreen> createState() => _VehicleServicesEngineOilLeakFormScreen();
}

class _VehicleServicesEngineOilLeakFormScreen extends State<VehicleServicesEngineOilLeakFormScreen> {
  late final GroupButtonController _groupButtonController;
  late final TextEditingController _priceController;
  @override
  void initState() {
    super.initState();

    _groupButtonController = GroupButtonController();
    _priceController = TextEditingController(text: widget.vehicle.priceEngineOilLeak?.toString() ?? "");
    if (widget.vehicle.engineOilLeak != null) {
      _groupButtonController.selectIndex(widget.vehicle.engineOilLeak! ? 1 : 0);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final isVisible = (_groupButtonController.selectedIndex ?? 0) > 0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).engine_oil_leak,
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
                      engineOilLeak: index > 0,
                      priceEngineOilLeak: index == 0 ? 0 : widget.vehicle.priceEngineOilLeak,
                    ),
                  );
                });
              },
            ),
            Visibility(
              visible: isVisible,
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
                      priceEngineOilLeak: val.isEmpty ? null : intl.NumberFormat().parse(val).toDouble(),
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
