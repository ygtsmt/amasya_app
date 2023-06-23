import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/auction/features/release_auction_filter_sheet/bloc/release_auction_filter_sheet_bloc.dart";
import "package:revogarageapp/app/features/auction/features/release_auction_filter_sheet/data/model/auction_create_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class RealaseAuctionFilterSheet extends StatefulWidget {
  const RealaseAuctionFilterSheet({super.key, this.vehicle});
  final VehicleLongDto? vehicle;
  @override
  State<RealaseAuctionFilterSheet> createState() => _RealaseAuctionFilterSheet();
}

class _RealaseAuctionFilterSheet extends State<RealaseAuctionFilterSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _priceController;
  final sellerId = getIt<AppBloc>().state.account?.id;
  double? price;
  final daysList = [
    SetAuctionTimeDay(1, "1"),
    SetAuctionTimeDay(2, "2"),
    SetAuctionTimeDay(3, "3"),
    SetAuctionTimeDay(4, "4"),
    SetAuctionTimeDay(5, "5"),
  ];

  int? minuteId;
  int? dayId;

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<ReleaseAuctionFilterSheetBloc, ReleaseAuctionFilterSheetState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          context.router.pop();
        }
        if (state.status == EventStatus.failure) {
          context.router.pop();
        }
      },
      builder: (final context, final state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).realase_auction,
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
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).price,
                      hintText: AppLocalizations.of(context).price_according_to_eurtax,
                      suffix: Text(
                        AppLocalizations.of(context).chf,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    validator: RequiredValidator(
                      errorText: AppLocalizations.current.empty_error,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    AppLocalizations.of(context).set_auction_time,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    AppLocalizations.of(context).set_auction_max_and_min_day,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          hint: Text(AppLocalizations.of(context).days),
                          items: daysList
                              .map(
                                (final days) => DropdownMenuItem(
                                  value: days.id,
                                  child: Text(days.day),
                                ),
                              )
                              .toList(),
                          onChanged: (final value) {
                            dayId = value;
                          },
                          validator: (final val) => val == null ? AppLocalizations.current.empty_error : null,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          hint: Text(AppLocalizations.of(context).minute),
                          items: List<SetAuctionTimeMinute>.generate(
                            60,
                            (final index) => SetAuctionTimeMinute(index + 1, (index + 1).toString()),
                          )
                              .map(
                                (final minute) => DropdownMenuItem(
                                  value: minute.id,
                                  child: Text(minute.minute),
                                ),
                              )
                              .toList(),
                          onChanged: (final value) {
                            minuteId = value;
                          },
                          validator: (final val) => val == null ? AppLocalizations.current.empty_error : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          price = double.parse(_priceController.text);
                          getIt<ReleaseAuctionFilterSheetBloc>().add(
                            CreateAuctionFilterSheetEvent(
                              auction: AuctionCreateDto(
                                vehicleId: widget.vehicle!.id,
                                expirationDate: DateTime.now().toUtc().add(
                                      Duration(
                                        days: dayId!,
                                        minutes: minuteId!,
                                      ),
                                    ),
                                startDate: DateTime.now().toUtc(),
                                startPrice: price!,
                                sellerId: sellerId!,
                                status: 0,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context).save.toUpperCase(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SetAuctionTimeDay {
  SetAuctionTimeDay(this.id, this.day);

  final int id;
  final String day;
}

class SetAuctionTimeMinute {
  SetAuctionTimeMinute(this.id, this.minute);

  final int id;
  final String minute;
}
