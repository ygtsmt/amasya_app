import "package:flutter/material.dart";

class AmasyaHomeButton extends StatelessWidget {
  const AmasyaHomeButton({
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
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 140, horizontal: MediaQuery.of(context).size.width / 100),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: MediaQuery.of(context).size.height / 25,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      //fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.height / 50,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
