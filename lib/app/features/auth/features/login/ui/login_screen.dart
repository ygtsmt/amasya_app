import "package:amasyaapp/app/features/auth/features/login/ui/login_form.dart";
import "package:flutter/material.dart";
import "package:flutter_adaptive_ui/flutter_adaptive_ui.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: AdaptiveBuilder(
            layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
              handset: (final BuildContext context, final Screen screen) {
                return const LoginForm();
              },
              tablet: (final BuildContext context, final Screen screen) {
                return const LoginForm();
              },
              desktop: (final BuildContext context, final Screen screen) {
                return const LoginForm();
              },
            ),
            defaultBuilder: (final BuildContext context, final Screen screen) {
              return const LoginForm();
            },
          ),
        ));
  }
}
