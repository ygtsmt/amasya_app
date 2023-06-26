import "package:flutter/material.dart";

class InfoCard extends StatelessWidget {
  const InfoCard({
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
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              children: [
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          )),
    );
  }
}
