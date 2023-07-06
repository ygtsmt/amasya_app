import "package:flutter/material.dart";

class SearchButton extends StatelessWidget {
  const SearchButton({
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 12.5,
          child: ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).buttonTheme.colorScheme!.onPrimary)),
            onPressed: onPressed,
            icon: Icon(icon),
            label: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )),
    );
  }
}
