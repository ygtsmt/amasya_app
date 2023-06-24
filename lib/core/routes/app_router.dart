// ignore_for_file: unused_import

import "package:auto_route/auto_route.dart";
import "package:auto_route/empty_router_widgets.dart";
import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/auth/features/create_account/ui/create_account_screen.dart";
import "package:revogarageapp/app/features/auth/features/create_garage/ui/garage_screen.dart";
import "package:revogarageapp/app/features/auth/features/login/ui/login_screen.dart";
import "package:revogarageapp/app/features/auth/features/splash/ui/splash_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_basic_form/ui/vehicle_basic_form_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_form/ui/vehicle_cost_form_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/data/models/vehicle_cost_list_short_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/ui/vehicle_cost_list_screen/vehicle_cost_list_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_form/ui/vehicle_damage_form_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/vehicle_damage_list_short_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/ui/vehicle_damage_list_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/vehicle_long_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/ui/vehicle_detail_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/ui/scan_vehicle_card_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/ui/vehicle_list_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_photo/ui/vehicle_photo_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_services_screen/ui/vehicle_services_screen.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/ui/vehicle_tire_screen.dart";
import "package:revogarageapp/app/features/dashboard/ui/screens/%20button_screens/belediye_projeleri.dart";
import "package:revogarageapp/app/features/dashboard/ui/screens/%20button_screens/hilal_masa.dart";
import "package:revogarageapp/app/features/dashboard/ui/screens/%20button_screens/nobetci_eczane.dart";
import "package:revogarageapp/app/features/dashboard/ui/screens/dashboard_screen.dart";
import "package:revogarageapp/app/features/dashboard/ui/screens/user_summary_screen.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/ui/customer_form_screen.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/ui/customer_list_screen.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_form/ui/drive_form_screen.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/models/drive_dto.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/ui/drive_list_screen.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_form/ui/licence_plate_form_screen.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/models/licence_plate_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/ui/licence_plate_list_screen.dart";
import "package:revogarageapp/app/features/pe/features/pe_vehicle_list/ui/pe_vehicle_list_screen/pe_vehicle_list_screen.dart";
import "package:revogarageapp/app/features/pe/features/right_form/ui/right_form_screen.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/models/right_list_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/right_list/ui/right_list_screen/right_list_screen.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_form/ui/sms_template_form_screen.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/data/models/sms_template_list_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/ui/sms_template_list_screen.dart";
import "package:revogarageapp/app/features/pe/ui/screens/create_sms_groups_screen/create_sms_groups_screen.dart";
import "package:revogarageapp/app/features/pe/ui/screens/pe_screen.dart/pe_screen.dart";
import "package:revogarageapp/app/features/pe/ui/screens/pick_members_of_group/pick_members_of_group.dart";
import "package:revogarageapp/app/features/pe/ui/screens/scan_driver_licence_screen.dart";
import "package:revogarageapp/app/features/pe/ui/screens/send_short_sms_add_recipients_screen/send_short_sms_add_recipients_screen.dart";
import "package:revogarageapp/app/features/pe/ui/screens/send_short_sms_screen/send_short_sms_screen.dart";
import "package:revogarageapp/app/features/pe/ui/screens/sms_groups_screen/sms_groups_screen.dart";
import "package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_form_screen/drive_archive_form_screen.dart";
import "package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_list/data/models/drive_archive_dto.dart";
import "package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_list/ui/drive_archive_list_screen.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/bloc/employee_form_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/ui/create_employee_form.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/data/models/employee_list_short_dto.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/ui/employee_list_screen/employee_list_screen.dart";
import "package:revogarageapp/app/features/profile/features/vehicle_archive_list/data/models/vehicle_archive_list_short_dto.dart";
import "package:revogarageapp/app/features/profile/features/vehicle_archive_list/ui/vehicle_archive_list_screen.dart";
import "package:revogarageapp/app/features/profile/ui/screens/bought_vehicles_list_screen/bought_vehicles_list_screen.dart";
import "package:revogarageapp/app/features/profile/ui/screens/employee_screen/employee_screen.dart";
import "package:revogarageapp/app/features/profile/ui/screens/invite_dealer_screen/invite_dealer_screen.dart";
import "package:revogarageapp/app/features/profile/ui/screens/profile_screen/profile_screen.dart";
import "package:revogarageapp/app/ui/home_screen.dart";
import "package:revogarageapp/core/core.dart";

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
              page: CustomerListScreen,
              path: "customer-list",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: CustomerScreen,
              path: "customer-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: LicencePlateFormScreen,
              path: "create-licence-plate-form",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: LicencePlateListScreen,
              path: "licence-plate-list-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: RightListScreen,
              path: "right-list-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: RightScreen,
              path: "create-right-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: SmsTemplateListScreen,
              path: "sms-template-list-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: SmsTemplateFormScreen,
              path: "sms-template-form-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: PeVehicleListScreen,
              path: "pe-vehicle-list-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: DriveListScreen,
              path: "drive-list",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: DriveFormScreen,
              path: "drive-form",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: SendShortSmsScreen,
              path: "sms-short-sms-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: SendShortSmsAddRecipientsScreen,
              path: "add-recipient-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: CheckGroupsScreen,
              path: "check-groups-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: CreateSmsGroupScreen,
              path: "create-sms-groups-screen",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: PickMembersOfGroup,
              path: "pick-members-of-group",
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
            CustomRoute(
              page: VehicleDetailScreen,
              path: "vehicle-detail",
              fullscreenDialog: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleBasicDetailsScreen,
              path: "capture-vehicle-details-form",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehiclePhotoScreen,
              path: "capture-vehicle-add-picture",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleTireScreen,
              path: "tire",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleDamageListScreen,
              path: "damage-list",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleDamageScreen,
              path: "damage",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleServicesScreen,
              path: "services",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleCostFormScreen,
              path: "cost",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleCostListScreen,
              path: "cost-list",
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleServicesScreen,
              path: "services",
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
            CustomRoute(
              page: InviteDealerScreen,
              path: "invite-dealer-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: EmployeeListScreen,
              path: "employee-list-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: EmployeeScreen,
              path: "employee-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: EmployeeForm,
              path: "employee-form",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: BoughtVehicleListScreen,
              path: "bought-vehicle-list-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: VehicleArchiveListScreen,
              path: "vehicle-archive-list-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: DriveArchiveListScreen,
              path: "drive-archive-list-screen",
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: DriveArchiveFormScreen,
              path: "drive-archive-form-screen",
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
