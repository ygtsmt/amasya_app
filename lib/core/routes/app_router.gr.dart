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
    LoginScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
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
    OtobusNeredeScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const OtobusNeredeScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtobusNeredeSurucuScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const OtobusNeredeSurucuScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtobusNeredeKullaniciScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const OtobusNeredeKullaniciScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NumberSixScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NumberSixScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NumberOneScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NumberOneScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NumberTwoScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NumberTwoScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NumberSixLocationRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NumberSixLocation(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NumberOneLocationRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NumberOneLocation(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NumberTwoLocationRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NumberTwoLocation(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DurakNumarasiAraScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DurakNumarasiAraScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtobusVarisSuresiListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OtobusVarisSuresiListScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: OtobusVarisSuresiListScreen(
          key: args.key,
          arrivalTimes: args.arrivalTimes,
          busNumber: args.busNumber,
          arrivalTime: args.arrivalTime,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ElmaKartScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ElmaKartScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    KentBilgisiScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const KentBilgisiScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    IletisimScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const IletisimScreen(),
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
          LoginScreenRoute.name,
          path: '/login',
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
                RouteConfig(
                  OtobusNeredeScreenRoute.name,
                  path: 'otobus-nerede-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  OtobusNeredeSurucuScreenRoute.name,
                  path: 'otobus-nerede-surucu-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  OtobusNeredeKullaniciScreenRoute.name,
                  path: 'otobus-nerede-kullanici-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  NumberSixScreenRoute.name,
                  path: 'otobus-number-six-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  NumberOneScreenRoute.name,
                  path: 'otobus-number-one-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  NumberTwoScreenRoute.name,
                  path: 'otobus-number-two-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  NumberSixLocationRoute.name,
                  path: 'number-six-location',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  NumberOneLocationRoute.name,
                  path: 'number-one-location',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  NumberTwoLocationRoute.name,
                  path: 'number-two-location',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  DurakNumarasiAraScreenRoute.name,
                  path: 'durak-numarasi-ara-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  OtobusVarisSuresiListScreenRoute.name,
                  path: 'otobus-varis-suresi-list-screen',
                  parent: DashbordTabRouter.name,
                ),
                RouteConfig(
                  ElmaKartScreenRoute.name,
                  path: 'elma-kart-screen',
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
                  redirectTo: 'kent-bilgisi-screen',
                  fullMatch: true,
                ),
                RouteConfig(
                  KentBilgisiScreenRoute.name,
                  path: 'kent-bilgisi-screen',
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
                  IletisimScreenRoute.name,
                  path: 'communication-screen',
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
  const ProfileTabRouter()
      : super(
          ProfileTabRouter.name,
          path: 'profile',
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
/// [OtobusNeredeScreen]
class OtobusNeredeScreenRoute extends PageRouteInfo<void> {
  const OtobusNeredeScreenRoute()
      : super(
          OtobusNeredeScreenRoute.name,
          path: 'otobus-nerede-screen',
        );

  static const String name = 'OtobusNeredeScreenRoute';
}

/// generated route for
/// [OtobusNeredeSurucuScreen]
class OtobusNeredeSurucuScreenRoute extends PageRouteInfo<void> {
  const OtobusNeredeSurucuScreenRoute()
      : super(
          OtobusNeredeSurucuScreenRoute.name,
          path: 'otobus-nerede-surucu-screen',
        );

  static const String name = 'OtobusNeredeSurucuScreenRoute';
}

/// generated route for
/// [OtobusNeredeKullaniciScreen]
class OtobusNeredeKullaniciScreenRoute extends PageRouteInfo<void> {
  const OtobusNeredeKullaniciScreenRoute()
      : super(
          OtobusNeredeKullaniciScreenRoute.name,
          path: 'otobus-nerede-kullanici-screen',
        );

  static const String name = 'OtobusNeredeKullaniciScreenRoute';
}

/// generated route for
/// [NumberSixScreen]
class NumberSixScreenRoute extends PageRouteInfo<void> {
  const NumberSixScreenRoute()
      : super(
          NumberSixScreenRoute.name,
          path: 'otobus-number-six-screen',
        );

  static const String name = 'NumberSixScreenRoute';
}

/// generated route for
/// [NumberOneScreen]
class NumberOneScreenRoute extends PageRouteInfo<void> {
  const NumberOneScreenRoute()
      : super(
          NumberOneScreenRoute.name,
          path: 'otobus-number-one-screen',
        );

  static const String name = 'NumberOneScreenRoute';
}

/// generated route for
/// [NumberTwoScreen]
class NumberTwoScreenRoute extends PageRouteInfo<void> {
  const NumberTwoScreenRoute()
      : super(
          NumberTwoScreenRoute.name,
          path: 'otobus-number-two-screen',
        );

  static const String name = 'NumberTwoScreenRoute';
}

/// generated route for
/// [NumberSixLocation]
class NumberSixLocationRoute extends PageRouteInfo<void> {
  const NumberSixLocationRoute()
      : super(
          NumberSixLocationRoute.name,
          path: 'number-six-location',
        );

  static const String name = 'NumberSixLocationRoute';
}

/// generated route for
/// [NumberOneLocation]
class NumberOneLocationRoute extends PageRouteInfo<void> {
  const NumberOneLocationRoute()
      : super(
          NumberOneLocationRoute.name,
          path: 'number-one-location',
        );

  static const String name = 'NumberOneLocationRoute';
}

/// generated route for
/// [NumberTwoLocation]
class NumberTwoLocationRoute extends PageRouteInfo<void> {
  const NumberTwoLocationRoute()
      : super(
          NumberTwoLocationRoute.name,
          path: 'number-two-location',
        );

  static const String name = 'NumberTwoLocationRoute';
}

/// generated route for
/// [DurakNumarasiAraScreen]
class DurakNumarasiAraScreenRoute extends PageRouteInfo<void> {
  const DurakNumarasiAraScreenRoute()
      : super(
          DurakNumarasiAraScreenRoute.name,
          path: 'durak-numarasi-ara-screen',
        );

  static const String name = 'DurakNumarasiAraScreenRoute';
}

/// generated route for
/// [OtobusVarisSuresiListScreen]
class OtobusVarisSuresiListScreenRoute
    extends PageRouteInfo<OtobusVarisSuresiListScreenRouteArgs> {
  OtobusVarisSuresiListScreenRoute({
    Key? key,
    required Map<String, String> arrivalTimes,
    required String busNumber,
    required String arrivalTime,
  }) : super(
          OtobusVarisSuresiListScreenRoute.name,
          path: 'otobus-varis-suresi-list-screen',
          args: OtobusVarisSuresiListScreenRouteArgs(
            key: key,
            arrivalTimes: arrivalTimes,
            busNumber: busNumber,
            arrivalTime: arrivalTime,
          ),
        );

  static const String name = 'OtobusVarisSuresiListScreenRoute';
}

class OtobusVarisSuresiListScreenRouteArgs {
  const OtobusVarisSuresiListScreenRouteArgs({
    this.key,
    required this.arrivalTimes,
    required this.busNumber,
    required this.arrivalTime,
  });

  final Key? key;

  final Map<String, String> arrivalTimes;

  final String busNumber;

  final String arrivalTime;

  @override
  String toString() {
    return 'OtobusVarisSuresiListScreenRouteArgs{key: $key, arrivalTimes: $arrivalTimes, busNumber: $busNumber, arrivalTime: $arrivalTime}';
  }
}

/// generated route for
/// [ElmaKartScreen]
class ElmaKartScreenRoute extends PageRouteInfo<void> {
  const ElmaKartScreenRoute()
      : super(
          ElmaKartScreenRoute.name,
          path: 'elma-kart-screen',
        );

  static const String name = 'ElmaKartScreenRoute';
}

/// generated route for
/// [KentBilgisiScreen]
class KentBilgisiScreenRoute extends PageRouteInfo<void> {
  const KentBilgisiScreenRoute()
      : super(
          KentBilgisiScreenRoute.name,
          path: 'kent-bilgisi-screen',
        );

  static const String name = 'KentBilgisiScreenRoute';
}

/// generated route for
/// [IletisimScreen]
class IletisimScreenRoute extends PageRouteInfo<void> {
  const IletisimScreenRoute()
      : super(
          IletisimScreenRoute.name,
          path: 'communication-screen',
        );

  static const String name = 'IletisimScreenRoute';
}
