import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_home_button.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/data_sources/local_data_source/secure_data_storage.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayDeleteAccountConfirmationDialog(final BuildContext context) async {
    return showDialog(
      context: context,
      builder: (final context) {
        return AlertDialog(
          title: Text(AppLocalizations.current.confirmDelete),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppLocalizations.current.confirmDeleteDescription),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                onChanged: (final value) {},
                controller: _textFieldController,
                decoration: InputDecoration(hintText: AppLocalizations.current.password),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.current.cancel),
              onPressed: () {
                _textFieldController.text = "";
                context.router.pop();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.current.delete),
              onPressed: () async {
                context.router.popUntilRoot();
                context.router.popForced();
                await context.router.root.replaceAll([const SplashScreenRoute()]);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (final context, final state) async {
        if (state.deleteAccountEventStatus == EventStatus.success) {
          final secureDataStorage = getIt<SecureDataStorage>();
          secureDataStorage.deleteAll();
          context.router.popUntilRoot();
          context.router.popForced();
          await context.router.root.replaceAll([const SplashScreenRoute()]);
        }
      },
      child: Column(
        children: [
          RevoScreenHeader(
            title: AppLocalizations.of(context).profile,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    // RevoHomeButton(
                    //   onPressed: () {
                    //     context.router.navigate(const BoughtVehicleListScreenRoute());
                    //   },
                    //   title: AppLocalizations.of(context).boughtVehicles,
                    //   icon: Icons.car_rental_outlined,
                    // ),
                    // RevoHomeButton(
                    //   onPressed: () {
                    //     context.router.navigate(const InviteDealerScreenRoute());
                    //   },
                    //   title: AppLocalizations.of(context).inviteDealer,
                    //   icon: Icons.people_alt_outlined,
                    // ),

                    ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      onPressed: () async {
                        context.router.popUntilRoot();
                        context.router.popForced();
                        await context.router.root.replaceAll([const SplashScreenRoute()]);
                      },
                      label: Text(
                        AppLocalizations.of(context).logout.toUpperCase(),
                      ),
                    ),

                    const SizedBox(height: 32),
                    TextButton(
                      onPressed: () async {
                        // final secureDataStorage = getIt<SecureDataStorage>();
                        // secureDataStorage.deleteAll();
                        // context.router.popUntilRoot();
                        // context.router.popForced();
                        // await context.router.root.replaceAll([const SplashScreenRoute()]);

                        _displayDeleteAccountConfirmationDialog(context);
                      },
                      child: Text(
                        AppLocalizations.of(context).deleteAccount.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Theme.of(context).colorScheme.error),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
