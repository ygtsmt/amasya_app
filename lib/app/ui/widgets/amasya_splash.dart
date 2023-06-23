import "package:flutter/material.dart";
import "package:revogarageapp/core/images.dart";

class AmasyaSplash extends StatelessWidget {
  const AmasyaSplash({
    super.key,
    this.themeMode = ThemeMode.dark,
  });
  final ThemeMode themeMode;

  @override
  Widget build(final BuildContext context) {
    return Hero(
      tag: "logo",
      child: Image.asset(
        Images.splashAmasya,
        color: themeMode == ThemeMode.dark ? Colors.white : Colors.black,
      ),
    );
  }
}
