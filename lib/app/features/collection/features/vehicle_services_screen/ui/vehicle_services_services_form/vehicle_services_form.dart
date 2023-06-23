import "package:currency_text_input_formatter/currency_text_input_formatter.dart";
import "package:flutter/material.dart";
import "package:group_button/group_button.dart";
import "package:intl/intl.dart" as intl;
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleServicesForm extends StatefulWidget {
  const VehicleServicesForm({required this.vehicle, required this.onChange, super.key});

  final VehicleLongDto vehicle;
  final Function(VehicleLongDto) onChange;

  @override
  State<VehicleServicesForm> createState() => _VehicleServicesFormState();
}

class _VehicleServicesFormState extends State<VehicleServicesForm> {
  late final GroupButtonController _serviceGroupButtonController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _serviceGroupButtonController = GroupButtonController();
    _priceController = TextEditingController(text: widget.vehicle.serviceTypePrice?.toString() ?? "");
    if (widget.vehicle.serviceType > 0) {
      _serviceGroupButtonController.selectIndex(widget.vehicle.serviceType - 1);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final isVisible = (_serviceGroupButtonController.selectedIndex ?? 0) > 0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).services,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(),
            const SizedBox(height: 16),
            GroupButton(
              controller: _serviceGroupButtonController,
              buttons: [
                AppLocalizations.of(context).no,
                AppLocalizations.of(context).small,
                AppLocalizations.of(context).big
              ],
              options: GroupButtonOptions(
                buttonWidth: 62,
                groupingType: GroupingType.row,
                mainGroupAlignment: MainGroupAlignment.spaceBetween,
                unselectedColor: Theme.of(context).colorScheme.secondaryContainer,
              ),
              onSelected: (final String val, final int index, final bool isSelected) {
                setState(() {
                  widget.onChange(
                    widget.vehicle.copyWith(
                      serviceType: index + 1,
                      serviceTypePrice: index == 0 ? 0 : widget.vehicle.serviceTypePrice,
                    ),
                  );
                });
              },
            ),
            Visibility(
              visible: isVisible,
              child: TextField(
                controller: _priceController,
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
                onChanged: (final val) {
                  widget.onChange(
                    widget.vehicle.copyWith(
                      serviceTypePrice: val.isEmpty ? null : intl.NumberFormat().parse(val).toDouble(),
                    ),
                  );
                },
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
