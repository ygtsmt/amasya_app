import "package:amasyaapp/app/ui/app_screen.dart";
import "package:amasyaapp/core/core.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:url_strategy/url_strategy.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  setPathUrlStrategy();

  runApp(const AppScreen());
}
