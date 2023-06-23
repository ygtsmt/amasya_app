import "package:currency_text_input_formatter/currency_text_input_formatter.dart";
import "package:flutter/material.dart";
import "package:group_button/group_button.dart";
import "package:intl/intl.dart" as intl;
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleServicesMfkFormScreen extends StatefulWidget {
  const VehicleServicesMfkFormScreen({required this.vehicle, required this.onChange, super.key});

  final VehicleLongDto vehicle;
  final Function(VehicleLongDto) onChange;

  @override
  State<VehicleServicesMfkFormScreen> createState() => _VehicleServicesMfkFormScreen();
}

class _VehicleServicesMfkFormScreen extends State<VehicleServicesMfkFormScreen> {
  late final GroupButtonController _groupButtonController;
  late final TextEditingController _priceController;
  @override
  void initState() {
    super.initState();

    _groupButtonController = GroupButtonController();
    _priceController = TextEditingController(text: widget.vehicle.mfk_Price?.toString() ?? "");
    if (widget.vehicle.mfk != null) {
      _groupButtonController.selectIndex(widget.vehicle.mfk! ? 1 : 0);
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
              AppLocalizations.of(context).mfk,
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
                      mfk: index > 0,
                      mfk_Price: index == 0 ? 0 : widget.vehicle.mfk_Price,
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
                      mfk_Price: _priceController.text.isEmpty
                          ? null
                          : intl.NumberFormat().parse(_priceController.text).toDouble(),
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
