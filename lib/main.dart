import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/app_screen.dart";
import "package:revogarageapp/core/core.dart";
import "package:url_strategy/url_strategy.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  setPathUrlStrategy();
  await getIt<ThemeService>().setSavedThemeMode();

  runApp(const AppScreen());
}
