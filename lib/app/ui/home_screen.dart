import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_adaptive_ui/flutter_adaptive_ui.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:amasyaapp/app/bloc/app_bloc.dart";
import 'package:amasyaapp/app/ui/widgets/amasya_logo.dart';
import 'package:amasyaapp/app/ui/widgets/amasya_bar.dart';
import "package:amasyaapp/core/routes/app_router.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (final context, final state) {
        return AutoTabsRouter(
          routes: const [
            DashbordTabRouter(),
            PeTabRouter(),
            CollectionTabRouter(),
            ProfileTabRouter(),
          ],
          builder: (final context, final child, final animation) {
            final tabsRouter = AutoTabsRouter.of(context);
            final screen = Screen.fromContext(context);

            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                drawer: const Drawer(),
                appBar: AppBar(
                  leading: const AutoLeadingButton(),
                  elevation: screen.isHandset ? 0 : 1,
                  scrolledUnderElevation: screen.isHandset ? 0 : 1,
                  backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
                  title: Center(
                    child: SizedBox(
                      height: 40,
                      child: AmasyaLogo(themeMode: state.themeMode),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.info_outline),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (final context) {
                            return const AboutDialog(
                              applicationName: "AMASYA APP",
                              applicationVersion: "1.0.0",
                              applicationLegalese: "© 2023 AMASYA APP",
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                body: SafeArea(
                  child: AdaptiveBuilder(
                    layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
                      handset: (final BuildContext context, final Screen screen) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: child,
                        );
                      },
                      tablet: (final BuildContext context, final Screen screen) {
                        return Row(
                          children: [
                            const Expanded(
                              child: AmasyaSideBar(),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: child,
                              ),
                            ),
                          ],
                        );
                      },
                      desktop: (final BuildContext context, final Screen screen) {
                        return Row(
                          children: [
                            const Expanded(
                              flex: 3,
                              child: AmasyaSideBar(),
                            ),
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: child,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.1,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    defaultBuilder: (final BuildContext context, final Screen screen) {
                      return child;
                    },
                  ),
                ),
                bottomNavigationBar: screen.isHandset
                    ? Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: BottomNavigationBar(
                          enableFeedback: true,
                          type: BottomNavigationBarType.fixed,
                          showSelectedLabels: true,
                          showUnselectedLabels: true,
                          items: const <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: Icon(Icons.dashboard_outlined),
                              label: "DASHBOARD",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.location_city_outlined),
                              label: "KENT BİLGİSİ",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.info_outlined),
                              label: "İLETİŞİM",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.person_outline),
                              label: "PROFİL",
                            ),
                          ],
                          currentIndex: tabsRouter.activeIndex,
                          onTap: tabsRouter.setActiveIndex,
                        ),
                      )
                    : null,
              ),
            );
          },
        );
      },
    );
  }
}
