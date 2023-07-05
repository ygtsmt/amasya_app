import "package:amasyaapp/app/bloc/app_bloc.dart";
import "package:amasyaapp/app/features/auth/features/login/ui/login_form.dart";
import 'package:amasyaapp/app/ui/widgets/amasya_screen_header.dart';
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
              AmasyaScreenHeader(
                title: "",
                actions: BlocBuilder<AppBloc, AppState>(
                  builder: (final context, final state) {
                    return SwitchListTile(
                      value: state.themeMode == ThemeMode.dark,
                      onChanged: (final bool value) {
                        getIt<AppBloc>().add(SetThemeEvent(value ? ThemeMode.dark : ThemeMode.light));
                      },
                      title: const Text("Karanlık Tema"),
                    );
                  },
                ),
              ),
            ],
          ),
          if (deneme.length > 2)
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
                    "Çıkış Yap",
                  ),
                ),
              ],
            ),
          if (deneme.length < 2)
            ElevatedButton.icon(
              icon: const Icon(Icons.login_outlined),
              onPressed: () async {
                context.router.popUntilRoot();
                context.router.popForced();
                await context.router.root.replaceAll([const LoginScreenRoute()]);
              },
              label: const Text(
                "Sürücü Girişi Yap",
              ),
            ),
        ],
      ),
    );
  }
}
