import "package:amasyaapp/app/ui/widgets/amasya_splash.dart";
import "package:amasyaapp/core/routes/app_router.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {   Future<void>.delayed(const Duration(seconds: 4), () {
                context.replaceRoute(const HomeScreenRoute());
    });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
          child: AmasyaSplash(),
        ),
      ),
    );
  }
}
