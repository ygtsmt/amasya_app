import "package:amasyaapp/app/features/auth/features/create_account/ui/create_account_form.dart";
import "package:flutter/material.dart";
import "package:flutter_adaptive_ui/flutter_adaptive_ui.dart";

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        extendBodyBehindAppBar: true,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: AdaptiveBuilder(
                  layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
                    handset: (final BuildContext context, final Screen screen) {
                      return const Column(
                        children: [
                          CreateAccountForm(),
                        ],
                      );
                    },
                    tablet: (final BuildContext context, final Screen screen) {
                      return const Column(
                        children: [
                          CreateAccountForm(),
                        ],
                      );
                    },
                    desktop: (final BuildContext context, final Screen screen) {
                      return const Column(
                        children: [
                          CreateAccountForm(),
                        ],
                      );
                    },
                  ),
                  defaultBuilder: (final BuildContext context, final Screen screen) {
                    return const CreateAccountForm();
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
