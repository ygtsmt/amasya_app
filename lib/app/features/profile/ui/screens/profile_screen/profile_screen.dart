import "package:amasyaapp/app/bloc/app_bloc.dart";
import "package:amasyaapp/app/ui/widgets/revo_screen_header.dart";
import "package:amasyaapp/core/data_sources/local_data_source/secure_data_storage.dart";
import "package:amasyaapp/core/enums.dart";
import "package:amasyaapp/core/injection/injection.dart";
import "package:amasyaapp/core/routes/app_router.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

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
          title: const Text("Onayla"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Bu hesabı silmek istiyor musun?"),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                onChanged: (final value) {},
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "password"),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            TextButton(
              child: const Text("vazgeç"),
              onPressed: () {
                _textFieldController.text = "";
                context.router.pop();
              },
            ),
            TextButton(
              child: const Text("Sil"),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              RevoScreenHeader(
                title: "Profil",
                actions: BlocBuilder<AppBloc, AppState>(
                  builder: (final context, final state) {
                    return SwitchListTile(
                      value: state.themeMode == ThemeMode.dark,
                      onChanged: (final bool value) {
                        getIt<AppBloc>().add(SetThemeEvent(value ? ThemeMode.dark : ThemeMode.light));
                      },
                      title: const Text("Dark Mode"),
                    );
                  },
                ),
              ),
              const RevoScreenHeader(
                title: "Merhaba Yiğit",
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  context.router.popUntilRoot();
                  context.router.popForced();
                  await context.router.root.replaceAll([const SplashScreenRoute()]);
                },
                label: const Text(
                  "Logout",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    _displayDeleteAccountConfirmationDialog(context);
                  },
                  icon: const Icon(Icons.delete_outline_outlined),
                  label: Text(
                    "Delete Account",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              )
              /*  TextButton(
                onPressed: () async {
                  _displayDeleteAccountConfirmationDialog(context);
                },
                child: Text(
                  AppLocalizations.of(context).deleteAccount.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ) */
            ],
          ),
        ],
      ),
    );
  }
}
