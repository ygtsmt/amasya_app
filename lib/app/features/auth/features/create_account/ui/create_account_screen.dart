import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_adaptive_ui/flutter_adaptive_ui.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:amasyaapp/app/features/auth/features/create_account/bloc/create_account_bloc.dart";
import "package:amasyaapp/app/features/auth/features/create_account/ui/create_account_form.dart";
import "package:amasyaapp/app/features/auth/ui/side_image.dart";
import "package:amasyaapp/core/core.dart";

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<CreateAccountBloc, CreateAccountState>(
        listener: (final context, final state) {
          if (state.status == EventStatus.success) {
            context.router.replaceAll([GarageScreenRoute(accountId: state.accountId!)]);
          }
        },
        builder: (final context, final state) {
          return GestureDetector(
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
                        return Column(
                          children: const [
                            CreateAccountForm(),
                          ],
                        );
                      },
                      tablet: (final BuildContext context, final Screen screen) {
                        return Column(
                          children: const [
                            CreateAccountForm(),
                          ],
                        );
                      },
                      desktop: (final BuildContext context, final Screen screen) {
                        return Column(
                          children: const [
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
          );
        },
      ),
    );
  }
}
