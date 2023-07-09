import "package:amasyaapp/app/bloc/app_bloc.dart";
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
          
        ],
      ),
    );
  }
}
