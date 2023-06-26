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
          key: args.key,
          parameter: args.parameter,
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
    PeScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PeScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CustomerListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CustomerListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CustomerScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CustomerScreenRouteArgs>(
          orElse: () => const CustomerScreenRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: CustomerScreen(
          key: args.key,
          customer: args.customer,
          name: args.name,
          surname: args.surname,
          birthDate: args.birthDate,
          licenceNumber: args.licenceNumber,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LicencePlateFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LicencePlateFormScreenRouteArgs>(
          orElse: () => const LicencePlateFormScreenRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: LicencePlateFormScreen(
          key: args.key,
          licencePlate: args.licencePlate,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LicencePlateListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const LicencePlateListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RightListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const RightListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RightScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RightScreenRouteArgs>(
          orElse: () => const RightScreenRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: RightScreen(
          key: args.key,
          right: args.right,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SmsTemplateListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SmsTemplateListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SmsTemplateFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SmsTemplateFormScreenRouteArgs>(
          orElse: () => const SmsTemplateFormScreenRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: SmsTemplateFormScreen(
          key: args.key,
          smsTemplate: args.smsTemplate,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PeVehicleListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PeVehicleListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DriveListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DriveListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DriveFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DriveFormScreenRouteArgs>(
          orElse: () => const DriveFormScreenRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DriveFormScreen(
          drive: args.drive,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SendShortSmsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SendShortSmsScreenRouteArgs>(
          orElse: () => const SendShortSmsScreenRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: SendShortSmsScreen(
          key: args.key,
          smsTemplateText: args.smsTemplateText,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SendShortSmsAddRecipientsScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SendShortSmsAddRecipientsScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CheckGroupsScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CheckGroupsScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateSmsGroupScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CreateSmsGroupScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PickMembersOfGroupRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PickMembersOfGroup(),
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
    VehicleDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleDetailScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehicleDetailScreen(
          vehicleId: args.vehicleId,
          key: args.key,
        ),
        fullscreenDialog: true,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleBasicDetailsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleBasicDetailsScreenRouteArgs>(
          orElse: () => const VehicleBasicDetailsScreenRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehicleBasicDetailsScreen(
          key: args.key,
          vehicle: args.vehicle,
          vin: args.vin,
          typeCertification: args.typeCertification,
          notes: args.notes,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehiclePhotoScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehiclePhotoScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehiclePhotoScreen(
          vehicleId: args.vehicleId,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleTireScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleTireScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehicleTireScreen(
          vehicleId: args.vehicleId,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleDamageListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleDamageListScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehicleDamageListScreen(
          vehicleId: args.vehicleId,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleDamageScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleDamageScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehicleDamageScreen(
          vehicleId: args.vehicleId,
          damageId: args.damageId,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleServicesScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleServicesScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehicleServicesScreen(
          vehicle: args.vehicle,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleCostFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleCostFormScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehicleCostFormScreen(
          vehicleId: args.vehicleId,
          key: args.key,
          vehicleCost: args.vehicleCost,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleCostListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleCostListScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VehicleCostListScreen(
          vehicleId: args.vehicleId,
          key: args.key,
        ),
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
    InviteDealerScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const InviteDealerScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EmployeeListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmployeeListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EmployeeScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmployeeScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EmployeeFormRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeFormRouteArgs>(
          orElse: () => const EmployeeFormRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: EmployeeForm(
          employeeId: args.employeeId,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BoughtVehicleListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const BoughtVehicleListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleArchiveListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const VehicleArchiveListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DriveArchiveListScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DriveArchiveListScreen(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DriveArchiveFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DriveArchiveFormScreenRouteArgs>(
          orElse: () => const DriveArchiveFormScreenRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DriveArchiveFormScreen(
          drive: args.drive,
          key: args.key,
        ),
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
                  CustomerListScreenRoute.name,
                  path: 'customer-list',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  CustomerScreenRoute.name,
                  path: 'customer-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  LicencePlateFormScreenRoute.name,
                  path: 'create-licence-plate-form',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  LicencePlateListScreenRoute.name,
                  path: 'licence-plate-list-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  RightListScreenRoute.name,
                  path: 'right-list-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  RightScreenRoute.name,
                  path: 'create-right-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  SmsTemplateListScreenRoute.name,
                  path: 'sms-template-list-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  SmsTemplateFormScreenRoute.name,
                  path: 'sms-template-form-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  PeVehicleListScreenRoute.name,
                  path: 'pe-vehicle-list-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  DriveListScreenRoute.name,
                  path: 'drive-list',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  DriveFormScreenRoute.name,
                  path: 'drive-form',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  SendShortSmsScreenRoute.name,
                  path: 'sms-short-sms-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  SendShortSmsAddRecipientsScreenRoute.name,
                  path: 'add-recipient-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  CheckGroupsScreenRoute.name,
                  path: 'check-groups-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  CreateSmsGroupScreenRoute.name,
                  path: 'create-sms-groups-screen',
                  parent: PeTabRouter.name,
                ),
                RouteConfig(
                  PickMembersOfGroupRoute.name,
                  path: 'pick-members-of-group',
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
                RouteConfig(
                  VehicleDetailScreenRoute.name,
                  path: 'vehicle-detail',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehicleBasicDetailsScreenRoute.name,
                  path: 'capture-vehicle-details-form',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehiclePhotoScreenRoute.name,
                  path: 'capture-vehicle-add-picture',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehicleTireScreenRoute.name,
                  path: 'tire',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehicleDamageListScreenRoute.name,
                  path: 'damage-list',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehicleDamageScreenRoute.name,
                  path: 'damage',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehicleServicesScreenRoute.name,
                  path: 'services',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehicleCostFormScreenRoute.name,
                  path: 'cost',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehicleCostListScreenRoute.name,
                  path: 'cost-list',
                  parent: CollectionTabRouter.name,
                ),
                RouteConfig(
                  VehicleServicesScreenRoute.name,
                  path: 'services',
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
                RouteConfig(
                  InviteDealerScreenRoute.name,
                  path: 'invite-dealer-screen',
                  parent: ProfileTabRouter.name,
                ),
                RouteConfig(
                  EmployeeListScreenRoute.name,
                  path: 'employee-list-screen',
                  parent: ProfileTabRouter.name,
                ),
                RouteConfig(
                  EmployeeScreenRoute.name,
                  path: 'employee-screen',
                  parent: ProfileTabRouter.name,
                ),
                RouteConfig(
                  EmployeeFormRoute.name,
                  path: 'employee-form',
                  parent: ProfileTabRouter.name,
                ),
                RouteConfig(
                  BoughtVehicleListScreenRoute.name,
                  path: 'bought-vehicle-list-screen',
                  parent: ProfileTabRouter.name,
                ),
                RouteConfig(
                  VehicleArchiveListScreenRoute.name,
                  path: 'vehicle-archive-list-screen',
                  parent: ProfileTabRouter.name,
                ),
                RouteConfig(
                  DriveArchiveListScreenRoute.name,
                  path: 'drive-archive-list-screen',
                  parent: ProfileTabRouter.name,
                ),
                RouteConfig(
                  DriveArchiveFormScreenRoute.name,
                  path: 'drive-archive-form-screen',
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
    Key? key,
    required int parameter,
  }) : super(
          DuyuruIcerikScreenRoute.name,
          path: 'duyuru-icerik-screen',
          args: DuyuruIcerikScreenRouteArgs(
            key: key,
            parameter: parameter,
          ),
        );

  static const String name = 'DuyuruIcerikScreenRoute';
}

class DuyuruIcerikScreenRouteArgs {
  const DuyuruIcerikScreenRouteArgs({
    this.key,
    required this.parameter,
  });

  final Key? key;

  final int parameter;

  @override
  String toString() {
    return 'DuyuruIcerikScreenRouteArgs{key: $key, parameter: $parameter}';
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
/// [CustomerListScreen]
class CustomerListScreenRoute extends PageRouteInfo<void> {
  const CustomerListScreenRoute()
      : super(
          CustomerListScreenRoute.name,
          path: 'customer-list',
        );

  static const String name = 'CustomerListScreenRoute';
}

/// generated route for
/// [CustomerScreen]
class CustomerScreenRoute extends PageRouteInfo<CustomerScreenRouteArgs> {
  CustomerScreenRoute({
    Key? key,
    CustomerDto? customer,
    String? name,
    String? surname,
    String? birthDate,
    String? licenceNumber,
  }) : super(
          CustomerScreenRoute.name,
          path: 'customer-screen',
          args: CustomerScreenRouteArgs(
            key: key,
            customer: customer,
            name: name,
            surname: surname,
            birthDate: birthDate,
            licenceNumber: licenceNumber,
          ),
        );

  static const String name = 'CustomerScreenRoute';
}

class CustomerScreenRouteArgs {
  const CustomerScreenRouteArgs({
    this.key,
    this.customer,
    this.name,
    this.surname,
    this.birthDate,
    this.licenceNumber,
  });

  final Key? key;

  final CustomerDto? customer;

  final String? name;

  final String? surname;

  final String? birthDate;

  final String? licenceNumber;

  @override
  String toString() {
    return 'CustomerScreenRouteArgs{key: $key, customer: $customer, name: $name, surname: $surname, birthDate: $birthDate, licenceNumber: $licenceNumber}';
  }
}

/// generated route for
/// [LicencePlateFormScreen]
class LicencePlateFormScreenRoute
    extends PageRouteInfo<LicencePlateFormScreenRouteArgs> {
  LicencePlateFormScreenRoute({
    Key? key,
    LicencePlateShortDto? licencePlate,
  }) : super(
          LicencePlateFormScreenRoute.name,
          path: 'create-licence-plate-form',
          args: LicencePlateFormScreenRouteArgs(
            key: key,
            licencePlate: licencePlate,
          ),
        );

  static const String name = 'LicencePlateFormScreenRoute';
}

class LicencePlateFormScreenRouteArgs {
  const LicencePlateFormScreenRouteArgs({
    this.key,
    this.licencePlate,
  });

  final Key? key;

  final LicencePlateShortDto? licencePlate;

  @override
  String toString() {
    return 'LicencePlateFormScreenRouteArgs{key: $key, licencePlate: $licencePlate}';
  }
}

/// generated route for
/// [LicencePlateListScreen]
class LicencePlateListScreenRoute extends PageRouteInfo<void> {
  const LicencePlateListScreenRoute()
      : super(
          LicencePlateListScreenRoute.name,
          path: 'licence-plate-list-screen',
        );

  static const String name = 'LicencePlateListScreenRoute';
}

/// generated route for
/// [RightListScreen]
class RightListScreenRoute extends PageRouteInfo<void> {
  const RightListScreenRoute()
      : super(
          RightListScreenRoute.name,
          path: 'right-list-screen',
        );

  static const String name = 'RightListScreenRoute';
}

/// generated route for
/// [RightScreen]
class RightScreenRoute extends PageRouteInfo<RightScreenRouteArgs> {
  RightScreenRoute({
    Key? key,
    RightListShortDto? right,
  }) : super(
          RightScreenRoute.name,
          path: 'create-right-screen',
          args: RightScreenRouteArgs(
            key: key,
            right: right,
          ),
        );

  static const String name = 'RightScreenRoute';
}

class RightScreenRouteArgs {
  const RightScreenRouteArgs({
    this.key,
    this.right,
  });

  final Key? key;

  final RightListShortDto? right;

  @override
  String toString() {
    return 'RightScreenRouteArgs{key: $key, right: $right}';
  }
}

/// generated route for
/// [SmsTemplateListScreen]
class SmsTemplateListScreenRoute extends PageRouteInfo<void> {
  const SmsTemplateListScreenRoute()
      : super(
          SmsTemplateListScreenRoute.name,
          path: 'sms-template-list-screen',
        );

  static const String name = 'SmsTemplateListScreenRoute';
}

/// generated route for
/// [SmsTemplateFormScreen]
class SmsTemplateFormScreenRoute
    extends PageRouteInfo<SmsTemplateFormScreenRouteArgs> {
  SmsTemplateFormScreenRoute({
    Key? key,
    SmsTemplateListShortDto? smsTemplate,
  }) : super(
          SmsTemplateFormScreenRoute.name,
          path: 'sms-template-form-screen',
          args: SmsTemplateFormScreenRouteArgs(
            key: key,
            smsTemplate: smsTemplate,
          ),
        );

  static const String name = 'SmsTemplateFormScreenRoute';
}

class SmsTemplateFormScreenRouteArgs {
  const SmsTemplateFormScreenRouteArgs({
    this.key,
    this.smsTemplate,
  });

  final Key? key;

  final SmsTemplateListShortDto? smsTemplate;

  @override
  String toString() {
    return 'SmsTemplateFormScreenRouteArgs{key: $key, smsTemplate: $smsTemplate}';
  }
}

/// generated route for
/// [PeVehicleListScreen]
class PeVehicleListScreenRoute extends PageRouteInfo<void> {
  const PeVehicleListScreenRoute()
      : super(
          PeVehicleListScreenRoute.name,
          path: 'pe-vehicle-list-screen',
        );

  static const String name = 'PeVehicleListScreenRoute';
}

/// generated route for
/// [DriveListScreen]
class DriveListScreenRoute extends PageRouteInfo<void> {
  const DriveListScreenRoute()
      : super(
          DriveListScreenRoute.name,
          path: 'drive-list',
        );

  static const String name = 'DriveListScreenRoute';
}

/// generated route for
/// [DriveFormScreen]
class DriveFormScreenRoute extends PageRouteInfo<DriveFormScreenRouteArgs> {
  DriveFormScreenRoute({
    DriveDto? drive,
    Key? key,
  }) : super(
          DriveFormScreenRoute.name,
          path: 'drive-form',
          args: DriveFormScreenRouteArgs(
            drive: drive,
            key: key,
          ),
        );

  static const String name = 'DriveFormScreenRoute';
}

class DriveFormScreenRouteArgs {
  const DriveFormScreenRouteArgs({
    this.drive,
    this.key,
  });

  final DriveDto? drive;

  final Key? key;

  @override
  String toString() {
    return 'DriveFormScreenRouteArgs{drive: $drive, key: $key}';
  }
}

/// generated route for
/// [SendShortSmsScreen]
class SendShortSmsScreenRoute
    extends PageRouteInfo<SendShortSmsScreenRouteArgs> {
  SendShortSmsScreenRoute({
    Key? key,
    String? smsTemplateText,
  }) : super(
          SendShortSmsScreenRoute.name,
          path: 'sms-short-sms-screen',
          args: SendShortSmsScreenRouteArgs(
            key: key,
            smsTemplateText: smsTemplateText,
          ),
        );

  static const String name = 'SendShortSmsScreenRoute';
}

class SendShortSmsScreenRouteArgs {
  const SendShortSmsScreenRouteArgs({
    this.key,
    this.smsTemplateText,
  });

  final Key? key;

  final String? smsTemplateText;

  @override
  String toString() {
    return 'SendShortSmsScreenRouteArgs{key: $key, smsTemplateText: $smsTemplateText}';
  }
}

/// generated route for
/// [SendShortSmsAddRecipientsScreen]
class SendShortSmsAddRecipientsScreenRoute extends PageRouteInfo<void> {
  const SendShortSmsAddRecipientsScreenRoute()
      : super(
          SendShortSmsAddRecipientsScreenRoute.name,
          path: 'add-recipient-screen',
        );

  static const String name = 'SendShortSmsAddRecipientsScreenRoute';
}

/// generated route for
/// [CheckGroupsScreen]
class CheckGroupsScreenRoute extends PageRouteInfo<void> {
  const CheckGroupsScreenRoute()
      : super(
          CheckGroupsScreenRoute.name,
          path: 'check-groups-screen',
        );

  static const String name = 'CheckGroupsScreenRoute';
}

/// generated route for
/// [CreateSmsGroupScreen]
class CreateSmsGroupScreenRoute extends PageRouteInfo<void> {
  const CreateSmsGroupScreenRoute()
      : super(
          CreateSmsGroupScreenRoute.name,
          path: 'create-sms-groups-screen',
        );

  static const String name = 'CreateSmsGroupScreenRoute';
}

/// generated route for
/// [PickMembersOfGroup]
class PickMembersOfGroupRoute extends PageRouteInfo<void> {
  const PickMembersOfGroupRoute()
      : super(
          PickMembersOfGroupRoute.name,
          path: 'pick-members-of-group',
        );

  static const String name = 'PickMembersOfGroupRoute';
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
/// [VehicleDetailScreen]
class VehicleDetailScreenRoute
    extends PageRouteInfo<VehicleDetailScreenRouteArgs> {
  VehicleDetailScreenRoute({
    required int vehicleId,
    Key? key,
  }) : super(
          VehicleDetailScreenRoute.name,
          path: 'vehicle-detail',
          args: VehicleDetailScreenRouteArgs(
            vehicleId: vehicleId,
            key: key,
          ),
        );

  static const String name = 'VehicleDetailScreenRoute';
}

class VehicleDetailScreenRouteArgs {
  const VehicleDetailScreenRouteArgs({
    required this.vehicleId,
    this.key,
  });

  final int vehicleId;

  final Key? key;

  @override
  String toString() {
    return 'VehicleDetailScreenRouteArgs{vehicleId: $vehicleId, key: $key}';
  }
}

/// generated route for
/// [VehicleBasicDetailsScreen]
class VehicleBasicDetailsScreenRoute
    extends PageRouteInfo<VehicleBasicDetailsScreenRouteArgs> {
  VehicleBasicDetailsScreenRoute({
    Key? key,
    VehicleLongDto? vehicle,
    String? vin,
    String? typeCertification,
    String? notes,
  }) : super(
          VehicleBasicDetailsScreenRoute.name,
          path: 'capture-vehicle-details-form',
          args: VehicleBasicDetailsScreenRouteArgs(
            key: key,
            vehicle: vehicle,
            vin: vin,
            typeCertification: typeCertification,
            notes: notes,
          ),
        );

  static const String name = 'VehicleBasicDetailsScreenRoute';
}

class VehicleBasicDetailsScreenRouteArgs {
  const VehicleBasicDetailsScreenRouteArgs({
    this.key,
    this.vehicle,
    this.vin,
    this.typeCertification,
    this.notes,
  });

  final Key? key;

  final VehicleLongDto? vehicle;

  final String? vin;

  final String? typeCertification;

  final String? notes;

  @override
  String toString() {
    return 'VehicleBasicDetailsScreenRouteArgs{key: $key, vehicle: $vehicle, vin: $vin, typeCertification: $typeCertification, notes: $notes}';
  }
}

/// generated route for
/// [VehiclePhotoScreen]
class VehiclePhotoScreenRoute
    extends PageRouteInfo<VehiclePhotoScreenRouteArgs> {
  VehiclePhotoScreenRoute({
    required int vehicleId,
    Key? key,
  }) : super(
          VehiclePhotoScreenRoute.name,
          path: 'capture-vehicle-add-picture',
          args: VehiclePhotoScreenRouteArgs(
            vehicleId: vehicleId,
            key: key,
          ),
        );

  static const String name = 'VehiclePhotoScreenRoute';
}

class VehiclePhotoScreenRouteArgs {
  const VehiclePhotoScreenRouteArgs({
    required this.vehicleId,
    this.key,
  });

  final int vehicleId;

  final Key? key;

  @override
  String toString() {
    return 'VehiclePhotoScreenRouteArgs{vehicleId: $vehicleId, key: $key}';
  }
}

/// generated route for
/// [VehicleTireScreen]
class VehicleTireScreenRoute extends PageRouteInfo<VehicleTireScreenRouteArgs> {
  VehicleTireScreenRoute({
    required int vehicleId,
    Key? key,
  }) : super(
          VehicleTireScreenRoute.name,
          path: 'tire',
          args: VehicleTireScreenRouteArgs(
            vehicleId: vehicleId,
            key: key,
          ),
        );

  static const String name = 'VehicleTireScreenRoute';
}

class VehicleTireScreenRouteArgs {
  const VehicleTireScreenRouteArgs({
    required this.vehicleId,
    this.key,
  });

  final int vehicleId;

  final Key? key;

  @override
  String toString() {
    return 'VehicleTireScreenRouteArgs{vehicleId: $vehicleId, key: $key}';
  }
}

/// generated route for
/// [VehicleDamageListScreen]
class VehicleDamageListScreenRoute
    extends PageRouteInfo<VehicleDamageListScreenRouteArgs> {
  VehicleDamageListScreenRoute({
    required int vehicleId,
    Key? key,
  }) : super(
          VehicleDamageListScreenRoute.name,
          path: 'damage-list',
          args: VehicleDamageListScreenRouteArgs(
            vehicleId: vehicleId,
            key: key,
          ),
        );

  static const String name = 'VehicleDamageListScreenRoute';
}

class VehicleDamageListScreenRouteArgs {
  const VehicleDamageListScreenRouteArgs({
    required this.vehicleId,
    this.key,
  });

  final int vehicleId;

  final Key? key;

  @override
  String toString() {
    return 'VehicleDamageListScreenRouteArgs{vehicleId: $vehicleId, key: $key}';
  }
}

/// generated route for
/// [VehicleDamageScreen]
class VehicleDamageScreenRoute
    extends PageRouteInfo<VehicleDamageScreenRouteArgs> {
  VehicleDamageScreenRoute({
    required int vehicleId,
    int? damageId,
    Key? key,
  }) : super(
          VehicleDamageScreenRoute.name,
          path: 'damage',
          args: VehicleDamageScreenRouteArgs(
            vehicleId: vehicleId,
            damageId: damageId,
            key: key,
          ),
        );

  static const String name = 'VehicleDamageScreenRoute';
}

class VehicleDamageScreenRouteArgs {
  const VehicleDamageScreenRouteArgs({
    required this.vehicleId,
    this.damageId,
    this.key,
  });

  final int vehicleId;

  final int? damageId;

  final Key? key;

  @override
  String toString() {
    return 'VehicleDamageScreenRouteArgs{vehicleId: $vehicleId, damageId: $damageId, key: $key}';
  }
}

/// generated route for
/// [VehicleServicesScreen]
class VehicleServicesScreenRoute
    extends PageRouteInfo<VehicleServicesScreenRouteArgs> {
  VehicleServicesScreenRoute({
    required VehicleLongDto vehicle,
    Key? key,
  }) : super(
          VehicleServicesScreenRoute.name,
          path: 'services',
          args: VehicleServicesScreenRouteArgs(
            vehicle: vehicle,
            key: key,
          ),
        );

  static const String name = 'VehicleServicesScreenRoute';
}

class VehicleServicesScreenRouteArgs {
  const VehicleServicesScreenRouteArgs({
    required this.vehicle,
    this.key,
  });

  final VehicleLongDto vehicle;

  final Key? key;

  @override
  String toString() {
    return 'VehicleServicesScreenRouteArgs{vehicle: $vehicle, key: $key}';
  }
}

/// generated route for
/// [VehicleCostFormScreen]
class VehicleCostFormScreenRoute
    extends PageRouteInfo<VehicleCostFormScreenRouteArgs> {
  VehicleCostFormScreenRoute({
    required int vehicleId,
    Key? key,
    VehicleCostListShortDto? vehicleCost,
  }) : super(
          VehicleCostFormScreenRoute.name,
          path: 'cost',
          args: VehicleCostFormScreenRouteArgs(
            vehicleId: vehicleId,
            key: key,
            vehicleCost: vehicleCost,
          ),
        );

  static const String name = 'VehicleCostFormScreenRoute';
}

class VehicleCostFormScreenRouteArgs {
  const VehicleCostFormScreenRouteArgs({
    required this.vehicleId,
    this.key,
    this.vehicleCost,
  });

  final int vehicleId;

  final Key? key;

  final VehicleCostListShortDto? vehicleCost;

  @override
  String toString() {
    return 'VehicleCostFormScreenRouteArgs{vehicleId: $vehicleId, key: $key, vehicleCost: $vehicleCost}';
  }
}

/// generated route for
/// [VehicleCostListScreen]
class VehicleCostListScreenRoute
    extends PageRouteInfo<VehicleCostListScreenRouteArgs> {
  VehicleCostListScreenRoute({
    required int vehicleId,
    Key? key,
  }) : super(
          VehicleCostListScreenRoute.name,
          path: 'cost-list',
          args: VehicleCostListScreenRouteArgs(
            vehicleId: vehicleId,
            key: key,
          ),
        );

  static const String name = 'VehicleCostListScreenRoute';
}

class VehicleCostListScreenRouteArgs {
  const VehicleCostListScreenRouteArgs({
    required this.vehicleId,
    this.key,
  });

  final int vehicleId;

  final Key? key;

  @override
  String toString() {
    return 'VehicleCostListScreenRouteArgs{vehicleId: $vehicleId, key: $key}';
  }
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

/// generated route for
/// [InviteDealerScreen]
class InviteDealerScreenRoute extends PageRouteInfo<void> {
  const InviteDealerScreenRoute()
      : super(
          InviteDealerScreenRoute.name,
          path: 'invite-dealer-screen',
        );

  static const String name = 'InviteDealerScreenRoute';
}

/// generated route for
/// [EmployeeListScreen]
class EmployeeListScreenRoute extends PageRouteInfo<void> {
  const EmployeeListScreenRoute()
      : super(
          EmployeeListScreenRoute.name,
          path: 'employee-list-screen',
        );

  static const String name = 'EmployeeListScreenRoute';
}

/// generated route for
/// [EmployeeScreen]
class EmployeeScreenRoute extends PageRouteInfo<void> {
  const EmployeeScreenRoute()
      : super(
          EmployeeScreenRoute.name,
          path: 'employee-screen',
        );

  static const String name = 'EmployeeScreenRoute';
}

/// generated route for
/// [EmployeeForm]
class EmployeeFormRoute extends PageRouteInfo<EmployeeFormRouteArgs> {
  EmployeeFormRoute({
    int? employeeId,
    Key? key,
  }) : super(
          EmployeeFormRoute.name,
          path: 'employee-form',
          args: EmployeeFormRouteArgs(
            employeeId: employeeId,
            key: key,
          ),
        );

  static const String name = 'EmployeeFormRoute';
}

class EmployeeFormRouteArgs {
  const EmployeeFormRouteArgs({
    this.employeeId,
    this.key,
  });

  final int? employeeId;

  final Key? key;

  @override
  String toString() {
    return 'EmployeeFormRouteArgs{employeeId: $employeeId, key: $key}';
  }
}

/// generated route for
/// [BoughtVehicleListScreen]
class BoughtVehicleListScreenRoute extends PageRouteInfo<void> {
  const BoughtVehicleListScreenRoute()
      : super(
          BoughtVehicleListScreenRoute.name,
          path: 'bought-vehicle-list-screen',
        );

  static const String name = 'BoughtVehicleListScreenRoute';
}

/// generated route for
/// [VehicleArchiveListScreen]
class VehicleArchiveListScreenRoute extends PageRouteInfo<void> {
  const VehicleArchiveListScreenRoute()
      : super(
          VehicleArchiveListScreenRoute.name,
          path: 'vehicle-archive-list-screen',
        );

  static const String name = 'VehicleArchiveListScreenRoute';
}

/// generated route for
/// [DriveArchiveListScreen]
class DriveArchiveListScreenRoute extends PageRouteInfo<void> {
  const DriveArchiveListScreenRoute()
      : super(
          DriveArchiveListScreenRoute.name,
          path: 'drive-archive-list-screen',
        );

  static const String name = 'DriveArchiveListScreenRoute';
}

/// generated route for
/// [DriveArchiveFormScreen]
class DriveArchiveFormScreenRoute
    extends PageRouteInfo<DriveArchiveFormScreenRouteArgs> {
  DriveArchiveFormScreenRoute({
    DriveDto? drive,
    Key? key,
  }) : super(
          DriveArchiveFormScreenRoute.name,
          path: 'drive-archive-form-screen',
          args: DriveArchiveFormScreenRouteArgs(
            drive: drive,
            key: key,
          ),
        );

  static const String name = 'DriveArchiveFormScreenRoute';
}

class DriveArchiveFormScreenRouteArgs {
  const DriveArchiveFormScreenRouteArgs({
    this.drive,
    this.key,
  });

  final DriveDto? drive;

  final Key? key;

  @override
  String toString() {
    return 'DriveArchiveFormScreenRouteArgs{drive: $drive, key: $key}';
  }
}
