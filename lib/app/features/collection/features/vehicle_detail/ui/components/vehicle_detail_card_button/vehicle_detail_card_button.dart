import "package:flutter/material.dart";

class VehicleDetailCardButton extends StatelessWidget {
  const VehicleDetailCardButton({
    required this.title,
    required this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
