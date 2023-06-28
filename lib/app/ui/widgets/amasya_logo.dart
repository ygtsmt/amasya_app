import "package:flutter/material.dart";
import "package:amasyaapp/core/images.dart";

class AmasyaLogo extends StatelessWidget {
  const AmasyaLogo({
    super.key,
    this.themeMode = ThemeMode.dark,
  });
  final ThemeMode themeMode;

  @override
  Widget build(final BuildContext context) {
    return Hero(
      tag: "logo",
      child: Image.asset(
        Images.logo,
        color: themeMode == ThemeMode.dark ? Colors.white : Colors.black,
      ),
    );
  }
}
