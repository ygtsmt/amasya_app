import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/auth/features/splash/bloc/splash_bloc.dart";
import "package:revogarageapp/app/ui/widgets/amasya_splash.dart";
import "package:revogarageapp/core/core.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future<void>.delayed(const Duration(seconds: 4), () {
      getIt<SplashBloc>().add(AutoLoginRequestEvent());
    });
  }

  @override
  Widget build(final BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (final context, final state) {
        if (state.autoLoginStatus == EventStatus.success) {
          if (state.account?.garageId == null) {
            context.replaceRoute(GarageScreenRoute(accountId: state.account!.id));
          } else {
            context.replaceRoute(const HomeScreenRoute());
          }
        } else if (state.autoLoginStatus == EventStatus.failure) {
          context.replaceRoute(const LoginScreenRoute());
        }
      },
      child: const Scaffold(
        body: Center(
          child: Center(
            child: AmasyaSplash(),
          ),
        ),
      ),
    );
  }
}
