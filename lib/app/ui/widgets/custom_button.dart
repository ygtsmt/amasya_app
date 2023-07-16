import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.title,
    required this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final String title;
  final IconData? icon;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 12.5,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 147, 5, 5))),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.white,
                  )
              ],
            )),
      ),
    );
  }
}
