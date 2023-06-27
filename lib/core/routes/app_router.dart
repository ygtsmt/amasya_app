// ignore_for_file: unused_import

import "package:auto_route/auto_route.dart";
import "package:auto_route/empty_router_widgets.dart";
import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/app/bloc/app_bloc.dart";
import "package:amasyaapp/app/features/auth/features/create_account/ui/create_account_screen.dart";
import "package:amasyaapp/app/features/auth/features/create_garage/ui/garage_screen.dart";
import "package:amasyaapp/app/features/auth/features/login/ui/login_screen.dart";
import "package:amasyaapp/app/features/auth/features/splash/ui/splash_screen.dart";

import "package:amasyaapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:amasyaapp/app/features/collection/features/vehicle_list/ui/scan_vehicle_card_screen.dart";
import "package:amasyaapp/app/features/collection/features/vehicle_list/ui/vehicle_list_screen.dart";

import "package:amasyaapp/app/features/dashboard/features/belediye_hizmetleri/belediye_hizmetleri_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/ui/duyuru_list_screen/duyuru_icerik_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/ui/duyuru_list_screen/duyuru_list_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/data/models/haber_model.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/ui/haberler_screen/haber_icerik_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/ui/haberler_screen/haberler_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/ui/hal_fiyatlari_list_screen/hal_fiyatlari_list_screen.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/%20button_screens/belediye_projeleri.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/%20button_screens/hilal_masa.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/%20button_screens/nobetci_eczane.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/dashboard_screen.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/user_summary_screen.dart";

import "package:amasyaapp/app/features/pe/ui/screens/pe_screen.dart/pe_screen.dart";
import "package:amasyaapp/app/features/pe/ui/screens/scan_driver_licence_screen.dart";

import "package:amasyaapp/app/features/profile/ui/screens/profile_screen/profile_screen.dart";
import "package:amasyaapp/app/ui/home_screen.dart";
import "package:amasyaapp/core/core.dart";

part "app_router.gr.dart";

@MaterialAutoRouter(
  routes: <CustomRoute>[
    CustomRoute(page: SplashScreen, path: "/", initial: true, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: GarageScreen, path: "/garage", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: LoginScreen, path: "/login", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: SignupScreen, path: "/register", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
      page: HomeScreen,
      path: "/home",
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        CustomRoute(
          page: EmptyRouterPage,
          name: "DashbordTabRouter",
          path: "dashboard",
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
                page: DashboardScreen,
                path: "dashboard-screen",
                initial: true,
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(page: UserSummaryScreen, path: "user-summary", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: HilalMasaScreen, path: "hilalmasa-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: BelediyeProjeleriScreen, path: "belediye-projeleri-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: NobetciEczaneScreen, path: "nobetci-eczane-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: HaberListScreen, path: "haber-list-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: HaberIcerikScreen, path: "haber-icerik-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: DuyuruIcerikScreen, path: "duyuru-icerik-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: DuyuruListScreen, path: "duyuru-list-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: HalFiyatlariListScreen, path: "hal-fiyatlari-list-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: BelediyeHizmetleriScreen, path: "belediye-hizmetleri-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
          ],
        ),
        CustomRoute(
          page: EmptyRouterPage,
          name: "PeTabRouter",
          path: "pe",
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
              page: PeScreen,
              path: "pe-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
           
            CustomRoute(
              page: ScanDriverLicenceScreen,
              path: "scan-driver-licence-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          ],
        ),
        CustomRoute(
          page: EmptyRouterPage,
          name: "CollectionTabRouter",
          path: "collection",
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
              page: Communication_Screen,
              path: "communication-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: ScanVehicleCardScreen,
              path: "scan-vehicle-card-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          
          ],
        ),
        CustomRoute(
          page: EmptyRouterPage,
          name: "AuctionTabRoute",
          path: "auction",
          transitionsBuilder: TransitionsBuilders.fadeIn,
          guards: [AuctionGuard],
          children: [],
        ),
        CustomRoute(
          page: EmptyRouterPage,
          name: "ProfileTabRouter",
          path: "profile",
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
              page: ProfileScreen,
              path: "profile-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          
          ],
        ),
      ],
    ),
  ],
)
@injectable
class AppRouter extends _$AppRouter {
  AppRouter() : super(auctionGuard: AuctionGuard());
}

@injectable
class AuctionGuard extends AutoRouteGuard {
  @override
  void onNavigation(final NavigationResolver resolver, final StackRouter router) {
    final authenticated = getIt<AppBloc>().state.hasAuctionAccess;
    if (authenticated) {
      // if user is authenticated we continue
      resolver.next();
    } else {
      // we redirect the user to our login page
      router.replace(
        const LoginScreenRoute(),
      );
    }
  }
}
