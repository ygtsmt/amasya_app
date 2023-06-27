import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:amasyaapp/app/bloc/app_bloc.dart";
import "package:amasyaapp/app/features/auth/features/create_account/bloc/create_account_bloc.dart";
import "package:amasyaapp/app/features/auth/features/create_garage/bloc/create_garage_bloc.dart";
import "package:amasyaapp/app/features/auth/features/login/bloc/login_bloc.dart";
import "package:amasyaapp/app/features/auth/features/splash/bloc/splash_bloc.dart";
import "package:amasyaapp/app/features/collection/features/vehicle_list/bloc/vehicle_list_bloc.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/bloc/duyuru_list_bloc.dart";
import 'package:amasyaapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart';
import "package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/bloc/hal_fiyatlari_list_bloc.dart";
import "package:amasyaapp/core/color_schemes.g.dart";
import "package:amasyaapp/core/core.dart";
import "package:amasyaapp/generated/l10n.dart";

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      final String defaultRouteName = WidgetsBinding.instance.window.defaultRouteName;
      if (defaultRouteName != "/") {
        SystemNavigator.routeInformationUpdated(location: "/", replace: true);
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (final context) => getIt<AppBloc>(),
        ),
      
        BlocProvider<VehicleListBloc>(
          create: (final context) => getIt<VehicleListBloc>(),
        ),
        BlocProvider<SplashBloc>(
          create: (final context) => getIt<SplashBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (final context) => getIt<LoginBloc>(),
        ),
        BlocProvider<CreateAccountBloc>(
          create: (final context) => getIt<CreateAccountBloc>(),
        ),
        BlocProvider<CreateGarageBloc>(
          create: (final context) => getIt<CreateGarageBloc>(),
        ),
      
        BlocProvider<HaberListBloc>(
          create: (final context) => getIt<HaberListBloc>(),
        ),
        BlocProvider<DuyuruListBloc>(
          create: (final context) => getIt<DuyuruListBloc>(),
        ),
        BlocProvider<HalFiyatlariListBloc>(
          create: (final context) => getIt<HalFiyatlariListBloc>(),
        ),
        
        
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (final context, final state) {
          return MaterialApp.router(
            scaffoldMessengerKey: snackbarKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.delegate.supportedLocales,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightColorScheme,
            //  fontFamily: GoogleFonts.lato().fontFamily,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: darkColorScheme,
          //   fontFamily: GoogleFonts.lato().fontFamily,
            ),
            themeMode: state.themeMode,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
