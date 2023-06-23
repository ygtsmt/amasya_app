import "package:currency_text_input_formatter/currency_text_input_formatter.dart";
import "package:flutter/material.dart";
import "package:group_button/group_button.dart";
import "package:intl/intl.dart" as intl;
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleServicesBreakFrontBreakRearFormScreen extends StatefulWidget {
  const VehicleServicesBreakFrontBreakRearFormScreen({required this.vehicle, required this.onChange, super.key});

  final VehicleLongDto vehicle;
  final Function(VehicleLongDto) onChange;

  @override
  State<VehicleServicesBreakFrontBreakRearFormScreen> createState() => _VehicleServicesBreakFrontBreakRearFormScreen();
}

class _VehicleServicesBreakFrontBreakRearFormScreen extends State<VehicleServicesBreakFrontBreakRearFormScreen> {
  late final GroupButtonController _breakFrontGroupButtonController;
  late final TextEditingController _breakFrontPriceController;

  late final GroupButtonController _breakRearGroupButtonController;
  late final TextEditingController _breakRearPriceController;

  @override
  void initState() {
    super.initState();
    _breakFrontGroupButtonController = GroupButtonController();
    _breakFrontPriceController = TextEditingController(text: widget.vehicle.priceBreaksFront?.toString() ?? "");

    _breakRearGroupButtonController = GroupButtonController();
    _breakRearPriceController = TextEditingController(text: widget.vehicle.priceBreaksRear?.toString() ?? "");

    if (widget.vehicle.breaksFront != null) {
      _breakFrontGroupButtonController.selectIndex(widget.vehicle.breaksFront! ? 1 : 0);
    }

    if (widget.vehicle.breaksRear != null) {
      _breakRearGroupButtonController.selectIndex(widget.vehicle.breaksRear! ? 1 : 0);
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
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context).break_front,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            GroupButton(
              controller: _breakFrontGroupButtonController,
              buttons: [
                AppLocalizations.of(context).good,
                AppLocalizations.of(context).replace,
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
                      breaksFront: index > 0,
                      priceBreaksFront: index == 0 ? 0 : widget.vehicle.priceBreaksFront,
                    ),
                  );
                });
              },
            ),
            Visibility(
              visible: (_breakFrontGroupButtonController.selectedIndex ?? 0) > 0,
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
                controller: _breakFrontPriceController,
                onChanged: (final val) {
                  widget.onChange(
                    widget.vehicle.copyWith(
                      priceBreaksFront: val.isEmpty ? null : intl.NumberFormat().parse(val).toDouble(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context).break_rear,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                GroupButton(
                  controller: _breakRearGroupButtonController,
                  buttons: [
                    AppLocalizations.of(context).good,
                    AppLocalizations.of(context).replace,
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
                          breaksRear: index > 0,
                          priceBreaksRear: index == 0 ? 0 : widget.vehicle.priceBreaksRear,
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
            Visibility(
              visible: (_breakRearGroupButtonController.selectedIndex ?? 0) > 0,
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
                controller: _breakRearPriceController,
                onChanged: (final val) {
                  widget.onChange(
                    widget.vehicle.copyWith(
                      priceBreaksRear: val.isEmpty ? null : intl.NumberFormat().parse(val).toDouble(),
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
