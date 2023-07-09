// ignore_for_file: unused_import

import "package:amasyaapp/app/features/auth/features/login/ui/login_screen.dart";
import "package:amasyaapp/app/features/auth/features/splash/ui/splash_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/belediye_hizmetleri/belediye_hizmetleri_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/ui/duyuru_list_screen/duyuru_icerik_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/ui/duyuru_list_screen/duyuru_list_screen.dart";
import 'package:amasyaapp/app/features/dashboard/features/elma_kart/ui/elma_kart_screen.dart';
import "package:amasyaapp/app/features/dashboard/features/haber_list/data/models/haber_model.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/ui/haberler_screen/haber_icerik_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/ui/haberler_screen/haberler_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/ui/hal_fiyatlari_list_screen/hal_fiyatlari_list_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/driver/numberOne/number_one_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/driver/numberSix/number_six_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/driver/numberTwo/number_two_screen.dart";
import 'package:amasyaapp/app/features/dashboard/features/otobus_nerede/driver/ui/surucu_screen.dart';
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/kullanici/durak_numarasi_arama_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/kullanici/number_one_location.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/kullanici/number_six_location.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/kullanici/number_two_location.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/kullanici/otobus_varis_suresi_list_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/ui/otobus_kullanici_screen.dart";
import "package:amasyaapp/app/features/dashboard/features/otobus_nerede/ui/otobus_nerede_screen.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/%20button_screens/belediye_projeleri.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/%20button_screens/hilal_masa.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/%20button_screens/nobetci_eczane.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/dashboard_screen.dart";
import "package:amasyaapp/app/features/dashboard/ui/screens/user_summary_screen.dart";
import 'package:amasyaapp/app/features/iletisim/features/iletisim_screen/ui/iletisim_screen.dart';
import 'package:amasyaapp/app/features/iletisim/features/iletisim_screen/ui/scan_vehicle_card_screen.dart';
import 'package:amasyaapp/app/features/kent_bilgisi/ui/screens/kent_bilgisi_screen.dart/kent_bilgisi_screen.dart';
import 'package:amasyaapp/app/features/kent_bilgisi/ui/screens/scan_driver_licence_screen.dart';
import "package:amasyaapp/app/ui/home_screen.dart";
import "package:amasyaapp/core/core.dart";
import "package:auto_route/auto_route.dart";
import "package:auto_route/empty_router_widgets.dart";
import "package:flutter/material.dart";
import "package:injectable/injectable.dart";

part "app_router.gr.dart";

@MaterialAutoRouter(
  routes: <CustomRoute>[
    CustomRoute(page: SplashScreen, path: "/", initial: true, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: LoginScreen, path: "/login", transitionsBuilder: TransitionsBuilders.fadeIn),
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
                page: BelediyeProjeleriScreen,
                path: "belediye-projeleri-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: NobetciEczaneScreen,
                path: "nobetci-eczane-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: HaberListScreen, path: "haber-list-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: HaberIcerikScreen, path: "haber-icerik-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: DuyuruIcerikScreen, path: "duyuru-icerik-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: DuyuruListScreen, path: "duyuru-list-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: HalFiyatlariListScreen,
                path: "hal-fiyatlari-list-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: BelediyeHizmetleriScreen,
                path: "belediye-hizmetleri-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: OtobusNeredeScreen, path: "otobus-nerede-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: OtobusNeredeSurucuScreen,
                path: "otobus-nerede-surucu-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: OtobusNeredeKullaniciScreen,
                path: "otobus-nerede-kullanici-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: NumberSixScreen,
                path: "otobus-number-six-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: NumberOneScreen,
                path: "otobus-number-one-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: NumberTwoScreen,
                path: "otobus-number-two-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: NumberSixLocation, path: "number-six-location", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: NumberOneLocation, path: "number-one-location", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: NumberTwoLocation, path: "number-two-location", transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: DurakNumarasiAraScreen,
                path: "durak-numarasi-ara-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(
                page: OtobusVarisSuresiListScreen,
                path: "otobus-varis-suresi-list-screen",
                transitionsBuilder: TransitionsBuilders.fadeIn),
            CustomRoute(page: ElmaKartScreen, path: "elma-kart-screen", transitionsBuilder: TransitionsBuilders.fadeIn),
          ],
        ),
        CustomRoute(
          page: EmptyRouterPage,
          name: "PeTabRouter",
          path: "pe",
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
              page: KentBilgisiScreen,
              path: "kent-bilgisi-screen",
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
              page: IletisimScreen,
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
          children: [],
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
    const LoginScreenRoute();
  }
}
