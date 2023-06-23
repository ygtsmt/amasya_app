import "package:flutter/material.dart";

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.onPressed,
    required this.title,
    required this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(final BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Container(
          height: MediaQuery.of(context).size.height / 16,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: GestureDetector(
              onTap: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Icon(icon),
                ],
              )),
        ),
      ),
    );
  }
}
