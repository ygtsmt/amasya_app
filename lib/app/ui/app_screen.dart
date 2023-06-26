import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/auth/features/create_account/bloc/create_account_bloc.dart";
import "package:revogarageapp/app/features/auth/features/create_garage/bloc/create_garage_bloc.dart";
import "package:revogarageapp/app/features/auth/features/login/bloc/login_bloc.dart";
import "package:revogarageapp/app/features/auth/features/splash/bloc/splash_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_basic_form/bloc/vehicle_basic_form_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_form/bloc/vehicle_cost_form_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/bloc/vehicle_cost_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_form/bloc/vehicle_damage_form_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/bloc/vehicle_damage_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/bloc/bloc/vehicle_detail_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/bloc/vehicle_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_photo/bloc/vehicle_photo_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/bloc/vehicle_tire_bloc.dart";
import "package:revogarageapp/app/features/dashboard/features/duyuru_list/bloc/duyuru_list_bloc.dart";
import 'package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart';
import "package:revogarageapp/app/features/pe/features/customer_form/bloc/customer_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/bloc/customer_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_form/bloc/drive_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/bloc/drive_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_form/bloc/bloc/licence_plate_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/bloc/licence_plate_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/pe_vehicle_list/bloc/pe_vehicle_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_form/bloc/right_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_list/bloc/right_list_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_form/bloc/sms_template_form_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/bloc/sms_template_list_bloc.dart";
import "package:revogarageapp/app/features/pe/ui/screens/send_short_sms_screen/bloc/send_short_sms_bloc.dart";
import "package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_list/bloc/drive_archive_list_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/bloc/employee_form_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/bloc/employee_list_bloc.dart";
import "package:revogarageapp/app/features/profile/features/vehicle_archive_list/bloc/vehicle_archive_list_bloc.dart";
import "package:revogarageapp/core/color_schemes.g.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/generated/l10n.dart";

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
        BlocProvider<RightListBloc>(
          create: (final context) => getIt<RightListBloc>(),
        ),
        BlocProvider<RightFormBloc>(
          create: (final context) => getIt<RightFormBloc>(),
        ),
        BlocProvider<CustomerListBloc>(
          create: (final context) => getIt<CustomerListBloc>(),
        ),
        BlocProvider<CustomerFormBloc>(
          create: (final context) => getIt<CustomerFormBloc>(),
        ),
        BlocProvider<VehicleListBloc>(
          create: (final context) => getIt<VehicleListBloc>(),
        ),
        BlocProvider<VehicleBasicFormBloc>(
          create: (final context) => getIt<VehicleBasicFormBloc>(),
        ),
        BlocProvider<VehicleDetailBloc>(
          create: (final context) => getIt<VehicleDetailBloc>(),
        ),
        BlocProvider<VehicleDamageListBloc>(
          create: (final context) => getIt<VehicleDamageListBloc>(),
        ),
        BlocProvider<VehicleDamageFormBloc>(
          create: (final context) => getIt<VehicleDamageFormBloc>(),
        ),
        BlocProvider<PeVehicleListBloc>(
          create: (final context) => getIt<PeVehicleListBloc>(),
        ),
        BlocProvider<LicencePlateListBloc>(
          create: (final context) => getIt<LicencePlateListBloc>(),
        ),
        BlocProvider<LicencePlateFormBloc>(
          create: (final context) => getIt<LicencePlateFormBloc>(),
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
        BlocProvider<VehiclePhotoBloc>(
          create: (final context) => getIt<VehiclePhotoBloc>(),
        ),
        BlocProvider<VehicleArchiveListBloc>(
          create: (final context) => getIt<VehicleArchiveListBloc>(),
        ),
        BlocProvider<EmployeeListBloc>(
          create: (final context) => getIt<EmployeeListBloc>(),
        ),
        BlocProvider<SmsTemplateListBloc>(
          create: (final context) => getIt<SmsTemplateListBloc>(),
        ),
        BlocProvider<VehicleTireBloc>(
          create: (final context) => getIt<VehicleTireBloc>(),
        ),
        BlocProvider<SmsTemplateFormBloc>(
          create: (final context) => getIt<SmsTemplateFormBloc>(),
        ),
        BlocProvider<DriveListBloc>(
          create: (final context) => getIt<DriveListBloc>(),
        ),
        BlocProvider<DriveFormBloc>(
          create: (final context) => getIt<DriveFormBloc>(),
        ),
        BlocProvider<SendShortSmsBloc>(
          create: (final context) => getIt<SendShortSmsBloc>(),
        ),
        BlocProvider<EmployeeFormBloc>(
          create: (final context) => getIt<EmployeeFormBloc>(),
        ),
        BlocProvider<VehicleCostListBloc>(
          create: (final context) => getIt<VehicleCostListBloc>(),
        ),
        BlocProvider<VehicleCostFormBloc>(
          create: (final context) => getIt<VehicleCostFormBloc>(),
        ),
        BlocProvider<DriveArchiveListBloc>(
          create: (final context) => getIt<DriveArchiveListBloc>(),
        ),
        BlocProvider<HaberListBloc>(
          create: (final context) => getIt<HaberListBloc>(),
        ),
        BlocProvider<DuyuruListBloc>(
          create: (final context) => getIt<DuyuruListBloc>(),
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
