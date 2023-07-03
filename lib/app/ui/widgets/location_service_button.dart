import "package:flutter/material.dart";

class LocationServiceButton extends StatelessWidget {
  const LocationServiceButton({
    required this.onPressed,
    required this.title,
    required this.description,
    super.key,
  });

  final VoidCallback onPressed;
  final String title;
  final String description;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ListTile(
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "($description)",
                textAlign: TextAlign.center,
              ),
              onTap: onPressed,
            ),
          )),
    );
  }
}
