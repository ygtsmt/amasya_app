import "package:auto_route/auto_route.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:revogarageapp/core/images.dart";
import "package:revogarageapp/generated/l10n.dart";

class PeVehicleSummarySheet extends StatefulWidget {
  const PeVehicleSummarySheet({super.key});

  @override
  State<PeVehicleSummarySheet> createState() => _PeVehicleSummarySheetState();
}

class _PeVehicleSummarySheetState extends State<PeVehicleSummarySheet> {
  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 0.7,
                      aspectRatio: 2,
                      enlargeCenterPage: true,
                    ),
                    items: [1, 2, 3, 4, 5].map((final i) {
                      return Builder(
                        builder: (final BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              Images.lamborghini,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Toyota Corolla - 2019",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "JH4KA7654LC000000",
                        ),
                        const SizedBox(height: 8),
                        Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Transmission:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Auto",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Color:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Black",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Fuel Type:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Gasoline",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Type Certification:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "1333MMSS",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Mileage:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "1234 km",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Internal Number:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "994444488",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Drivable:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Yes",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 32,
                        ),
                        Align(
                          child: Text(
                            "Condition",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Service:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Big - 123 CHF",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "MFK:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Yes - 123 CHF",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Break Front:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Replace - 123 CHF",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Break Rear:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Good",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Engine Oil Leak:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "No",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Control Light:",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "No",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 32,
                        ),
                        Align(
                          child: Text(
                            AppLocalizations.of(context).damages,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Door Front Left - 123 CHF",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.photo_outlined))
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Door Front Left - 123 CHF",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.photo_outlined))
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Door Front Left - 123 CHF",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.photo_outlined))
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Door Front Left - 123 CHF",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.photo_outlined))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
