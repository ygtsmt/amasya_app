import "package:flutter/material.dart";

class OtobusCard extends StatelessWidget {
  const OtobusCard({
    required this.onTap,
    required this.otobusNo,
    required this.time,
    super.key,
  });

  final VoidCallback onTap;
  final String otobusNo;
  final String time;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 140, horizontal: MediaQuery.of(context).size.width / 100),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Icon(Icons.directions_bus_filled_outlined),
              Text(
                "$otobusNo Numaralı Otobüs",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                time,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
