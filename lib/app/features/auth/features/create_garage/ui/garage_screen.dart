import "package:amasyaapp/app/features/auth/features/create_garage/bloc/create_garage_bloc.dart";
import "package:amasyaapp/app/features/auth/features/create_garage/ui/garage_form.dart";
import "package:amasyaapp/core/core.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_adaptive_ui/flutter_adaptive_ui.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class GarageScreen extends StatefulWidget {
  const GarageScreen({required this.accountId, super.key});
  final int accountId;

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<CreateGarageBloc, CreateGarageState>(
        listener: (final context, final state) {
          if (state.status == EventStatus.success) {
            context.router.replace(const HomeScreenRoute());
          }
        },
        builder: (final context, final state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: AdaptiveBuilder(
                    layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
                      handset: (final BuildContext context, final Screen screen) {
                        return Column(
                          children: [
                            GarageScreenForm(
                              accountId: widget.accountId,
                            ),
                          ],
                        );
                      },
                      tablet: (final BuildContext context, final Screen screen) {
                        return Column(
                          children: [
                            GarageScreenForm(
                              accountId: widget.accountId,
                            ),
                          ],
                        );
                      },
                      desktop: (final BuildContext context, final Screen screen) {
                        return Column(
                          children: [
                            GarageScreenForm(
                              accountId: widget.accountId,
                            ),
                          ],
                        );
                      },
                    ),
                    defaultBuilder: (final BuildContext context, final Screen screen) {
                      return GarageScreenForm(accountId: widget.accountId);
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
