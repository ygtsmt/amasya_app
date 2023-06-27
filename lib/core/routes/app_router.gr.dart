// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.auctionGuard,
  }) : super(navigatorKey);

  final AuctionGuard auctionGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GarageScreenRoute.name: (routeData) {
      final args = routeData.argsAs<GarageScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: GarageScreen(
          accountId: args.accountId,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignupScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashbordTabRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PeTabRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CollectionTabRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuctionTabRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileTabRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserSummaryScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const UserSummaryScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HilalMasaScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HilalMasaScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BelediyeProjeleriScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const BelediyeProjeleriScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NobetciEczaneScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NobetciEczaneScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HaberListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HaberListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HaberIcerikScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HaberIcerikScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: HaberIcerikScreen(
          key: args.key,
          parameter: args.parameter,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DuyuruIcerikScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DuyuruIcerikScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DuyuruIcerikScreen(
          parameter: args.parameter,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DuyuruListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DuyuruListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HalFiyatlariListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HalFiyatlariListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BelediyeHizmetleriScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const BelediyeHizmetleriScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PeScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PeScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScanDriverLicenceScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ScanDriverLicenceScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Communication_ScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const Communication_Screen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScanVehicleCardScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ScanVehicleCardScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          GarageScreenRoute.name,
          path: '/garage',
        ),
        RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        RouteConfig(
          SignupScreenRoute.name,
          path: '/register',
        ),
        RouteConfig(
          HomeScreenRoute.name,
          path: '/home',
          children: [
            RouteConfig(
              DashbordTabRouter.name,
              path: 'dashboard',
              parent: HomeScreenRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: DashbordTabRouter.name,
                  redirectTo: 'dashboard-screen',
                  fullMatch: true,
                ),
                RouteConfig(
                  DashboardScreenRoute.name,
                  path: 'dashboard-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  UserSummaryScreenRoute.name,
                  path: 'user-summary',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  HilalMasaScreenRoute.name,
                  path: 'hilalmasa-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  BelediyeProjeleriScreenRoute.name,
                  path: 'belediye-projeleri-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  NobetciEczaneScreenRoute.name,
                  path: 'nobetci-eczane-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  HaberListScreenRoute.name,
                  path: 'haber-list-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  HaberIcerikScreenRoute.name,
                  path: 'haber-icerik-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  DuyuruIcerikScreenRoute.name,
                  path: 'duyuru-icerik-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  DuyuruListScreenRoute.name,
                  path: 'duyuru-list-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  HalFiyatlariListScreenRoute.name,
                  path: 'hal-fiyatlari-list-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  BelediyeHizmetleriScreenRoute.name,
                  path: 'belediye-hizmetleri-screen',
                  parent: DashbordTabRouter.name,
                ),
              ],
            ),
            RouteConfig(
              PeTabRouter.name,
              path: 'pe',
              parent: HomeScreenRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: PeTabRouter.name,
                  redirectTo: 'pe-screen',
                  fullMatch: true,
                ),
                RouteConfig(
                  PeScreenRoute.name,
                  path: 'pe-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  ScanDriverLicenceScreenRoute.name,
                  path: 'scan-driver-licence-screen',
                  parent: PeTabRouter.name,
                ),
              ],
            ),
            RouteConfig(
              CollectionTabRouter.name,
              path: 'collection',
              parent: HomeScreenRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: CollectionTabRouter.name,
                  redirectTo: 'communication-screen',
                  fullMatch: true,
                ),
                RouteConfig(
                  Communication_ScreenRoute.name,
                  path: 'communication-screen',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  ScanVehicleCardScreenRoute.name,
                  path: 'scan-vehicle-card-screen',
                  parent: CollectionTabRouter.name,
                ),
              ],
            ),
            RouteConfig(
              AuctionTabRoute.name,
              path: 'auction',
              parent: HomeScreenRoute.name,
              guards: [auctionGuard],
            ),
            RouteConfig(
              ProfileTabRouter.name,
              path: 'profile',
              parent: HomeScreenRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: ProfileTabRouter.name,
                  redirectTo: 'profile-screen',
                  fullMatch: true,
                ),
                RouteConfig(
                  ProfileScreenRoute.name,
                  path: 'profile-screen',
                  parent: ProfileTabRouter.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [GarageScreen]
class GarageScreenRoute extends PageRouteInfo<GarageScreenRouteArgs> {
  GarageScreenRoute({
    required int accountId,
    Key? key,
  }) : super(
          GarageScreenRoute.name,
          path: '/garage',
          args: GarageScreenRouteArgs(
            accountId: accountId,
            key: key,
          ),
        );

  static const String name = 'GarageScreenRoute';
}

class GarageScreenRouteArgs {
  const GarageScreenRouteArgs({
    required this.accountId,
    this.key,
  });

  final int accountId;

  final Key? key;

  @override
  String toString() {
    return 'GarageScreenRouteArgs{accountId: $accountId, key: $key}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [SignupScreen]
class SignupScreenRoute extends PageRouteInfo<void> {
  const SignupScreenRoute()
      : super(
          SignupScreenRoute.name,
          path: '/register',
        );

  static const String name = 'SignupScreenRoute';
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          path: '/home',
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [EmptyRouterPage]
class DashbordTabRouter extends PageRouteInfo<void> {
  const DashbordTabRouter({List<PageRouteInfo>? children})
      : super(
          DashbordTabRouter.name,
          path: 'dashboard',
          initialChildren: children,
        );

  static const String name = 'DashbordTabRouter';
}

/// generated route for
/// [EmptyRouterPage]
class PeTabRouter extends PageRouteInfo<void> {
  const PeTabRouter({List<PageRouteInfo>? children})
      : super(
          PeTabRouter.name,
          path: 'pe',
          initialChildren: children,
        );

  static const String name = 'PeTabRouter';
}

/// generated route for
/// [EmptyRouterPage]
class CollectionTabRouter extends PageRouteInfo<void> {
  const CollectionTabRouter({List<PageRouteInfo>? children})
      : super(
          CollectionTabRouter.name,
          path: 'collection',
          initialChildren: children,
        );

  static const String name = 'CollectionTabRouter';
}

/// generated route for
/// [EmptyRouterPage]
class AuctionTabRoute extends PageRouteInfo<void> {
  const AuctionTabRoute()
      : super(
          AuctionTabRoute.name,
          path: 'auction',
        );

  static const String name = 'AuctionTabRoute';
}

/// generated route for
/// [EmptyRouterPage]
class ProfileTabRouter extends PageRouteInfo<void> {
  const ProfileTabRouter({List<PageRouteInfo>? children})
      : super(
          ProfileTabRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileTabRouter';
}

/// generated route for
/// [DashboardScreen]
class DashboardScreenRoute extends PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(
          DashboardScreenRoute.name,
          path: 'dashboard-screen',
        );

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [UserSummaryScreen]
class UserSummaryScreenRoute extends PageRouteInfo<void> {
  const UserSummaryScreenRoute()
      : super(
          UserSummaryScreenRoute.name,
          path: 'user-summary',
        );

  static const String name = 'UserSummaryScreenRoute';
}

/// generated route for
/// [HilalMasaScreen]
class HilalMasaScreenRoute extends PageRouteInfo<void> {
  const HilalMasaScreenRoute()
      : super(
          HilalMasaScreenRoute.name,
          path: 'hilalmasa-screen',
        );

  static const String name = 'HilalMasaScreenRoute';
}

/// generated route for
/// [BelediyeProjeleriScreen]
class BelediyeProjeleriScreenRoute extends PageRouteInfo<void> {
  const BelediyeProjeleriScreenRoute()
      : super(
          BelediyeProjeleriScreenRoute.name,
          path: 'belediye-projeleri-screen',
        );

  static const String name = 'BelediyeProjeleriScreenRoute';
}

/// generated route for
/// [NobetciEczaneScreen]
class NobetciEczaneScreenRoute extends PageRouteInfo<void> {
  const NobetciEczaneScreenRoute()
      : super(
          NobetciEczaneScreenRoute.name,
          path: 'nobetci-eczane-screen',
        );

  static const String name = 'NobetciEczaneScreenRoute';
}

/// generated route for
/// [HaberListScreen]
class HaberListScreenRoute extends PageRouteInfo<void> {
  const HaberListScreenRoute()
      : super(
          HaberListScreenRoute.name,
          path: 'haber-list-screen',
        );

  static const String name = 'HaberListScreenRoute';
}

/// generated route for
/// [HaberIcerikScreen]
class HaberIcerikScreenRoute extends PageRouteInfo<HaberIcerikScreenRouteArgs> {
  HaberIcerikScreenRoute({
    Key? key,
    required int parameter,
  }) : super(
          HaberIcerikScreenRoute.name,
          path: 'haber-icerik-screen',
          args: HaberIcerikScreenRouteArgs(
            key: key,
            parameter: parameter,
          ),
        );

  static const String name = 'HaberIcerikScreenRoute';
}

class HaberIcerikScreenRouteArgs {
  const HaberIcerikScreenRouteArgs({
    this.key,
    required this.parameter,
  });

  final Key? key;

  final int parameter;

  @override
  String toString() {
    return 'HaberIcerikScreenRouteArgs{key: $key, parameter: $parameter}';
  }
}

/// generated route for
/// [DuyuruIcerikScreen]
class DuyuruIcerikScreenRoute
    extends PageRouteInfo<DuyuruIcerikScreenRouteArgs> {
  DuyuruIcerikScreenRoute({
    required int parameter,
    Key? key,
  }) : super(
          DuyuruIcerikScreenRoute.name,
          path: 'duyuru-icerik-screen',
          args: DuyuruIcerikScreenRouteArgs(
            parameter: parameter,
            key: key,
          ),
        );

  static const String name = 'DuyuruIcerikScreenRoute';
}

class DuyuruIcerikScreenRouteArgs {
  const DuyuruIcerikScreenRouteArgs({
    required this.parameter,
    this.key,
  });

  final int parameter;

  final Key? key;

  @override
  String toString() {
    return 'DuyuruIcerikScreenRouteArgs{parameter: $parameter, key: $key}';
  }
}

/// generated route for
/// [DuyuruListScreen]
class DuyuruListScreenRoute extends PageRouteInfo<void> {
  const DuyuruListScreenRoute()
      : super(
          DuyuruListScreenRoute.name,
          path: 'duyuru-list-screen',
        );

  static const String name = 'DuyuruListScreenRoute';
}

/// generated route for
/// [HalFiyatlariListScreen]
class HalFiyatlariListScreenRoute extends PageRouteInfo<void> {
  const HalFiyatlariListScreenRoute()
      : super(
          HalFiyatlariListScreenRoute.name,
          path: 'hal-fiyatlari-list-screen',
        );

  static const String name = 'HalFiyatlariListScreenRoute';
}

/// generated route for
/// [BelediyeHizmetleriScreen]
class BelediyeHizmetleriScreenRoute extends PageRouteInfo<void> {
  const BelediyeHizmetleriScreenRoute()
      : super(
          BelediyeHizmetleriScreenRoute.name,
          path: 'belediye-hizmetleri-screen',
        );

  static const String name = 'BelediyeHizmetleriScreenRoute';
}

/// generated route for
/// [PeScreen]
class PeScreenRoute extends PageRouteInfo<void> {
  const PeScreenRoute()
      : super(
          PeScreenRoute.name,
          path: 'pe-screen',
        );

  static const String name = 'PeScreenRoute';
}

/// generated route for
/// [ScanDriverLicenceScreen]
class ScanDriverLicenceScreenRoute extends PageRouteInfo<void> {
  const ScanDriverLicenceScreenRoute()
      : super(
          ScanDriverLicenceScreenRoute.name,
          path: 'scan-driver-licence-screen',
        );

  static const String name = 'ScanDriverLicenceScreenRoute';
}

/// generated route for
/// [Communication_Screen]
class Communication_ScreenRoute extends PageRouteInfo<void> {
  const Communication_ScreenRoute()
      : super(
          Communication_ScreenRoute.name,
          path: 'communication-screen',
        );

  static const String name = 'Communication_ScreenRoute';
}

/// generated route for
/// [ScanVehicleCardScreen]
class ScanVehicleCardScreenRoute extends PageRouteInfo<void> {
  const ScanVehicleCardScreenRoute()
      : super(
          ScanVehicleCardScreenRoute.name,
          path: 'scan-vehicle-card-screen',
        );

  static const String name = 'ScanVehicleCardScreenRoute';
}

/// generated route for
/// [ProfileScreen]
class ProfileScreenRoute extends PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile-screen',
        );

  static const String name = 'ProfileScreenRoute';
}
