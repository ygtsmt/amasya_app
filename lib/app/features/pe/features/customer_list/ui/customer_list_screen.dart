import "package:auto_route/auto_route.dart";
import "package:floating_action_bubble/floating_action_bubble.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/bloc/customer_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    getIt<CustomerListBloc>().add(GetCustomerListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).customers,
              actions: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.current.search,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CustomerListBloc, CustomerListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.customerList.length,
                    itemBuilder: (final context, final index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.router.navigate(
                              CustomerScreenRoute(
                                customer: state.customerList[index],
                              ),
                            );
                          },
                          visualDensity: VisualDensity.comfortable,
                          title: Text("${state.customerList[index].name} ${state.customerList[index].surname}"),
                          trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FloatingActionBubble(
            items: <Bubble>[
              Bubble(
                title: AppLocalizations.of(context).manually_add,
                iconColor: Theme.of(context).colorScheme.primary,
                bubbleColor: Theme.of(context).colorScheme.primaryContainer,
                icon: Icons.directions_car_filled_outlined,
                titleStyle: Theme.of(context).textTheme.titleMedium!,
                onPress: () {
                  context.router.navigate(CustomerScreenRoute());
                  _animationController?.reverse();
                },
              ),
              Bubble(
                title: AppLocalizations.of(context).scan_license,
                iconColor: Theme.of(context).colorScheme.secondary,
                bubbleColor: Theme.of(context).colorScheme.primaryContainer,
                icon: Icons.photo_camera_outlined,
                titleStyle: Theme.of(context).textTheme.titleMedium!,
                onPress: () {
                  context.router.navigate(const ScanDriverLicenceScreenRoute());
                  _animationController?.reverse();
                },
              ),
            ],
            animation: _animation,
            onPress: () =>
                _animationController!.isCompleted ? _animationController?.reverse() : _animationController?.forward(),
            backGroundColor: Theme.of(context).colorScheme.primaryContainer,
            iconColor: Theme.of(context).colorScheme.secondary,
            iconData: Icons.add,
          ),
        ),
      ],
    );
  }
}

/* import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/bloc/customer_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";
import "package:revogarageapp/core/routes/app_router.dart";

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<CustomerListBloc>().add(GetCustomerListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).customers,
              actions: TextField(
                onChanged: (final value) {
                  if (value.isEmpty) {
                    getIt<CustomerListBloc>().add(GetCustomerListEvent());
                  } else {
                    getIt<CustomerListBloc>().add(SearchCustomerListEvent(value));
                  }
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.current.search,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CustomerListBloc, CustomerListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.customerList.length,
                    itemBuilder: (final context, final index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.router.navigate(
                              CustomerScreenRoute(
                                customer: state.customerList[index],
                              ),
                            );
                          },
                          visualDensity: VisualDensity.comfortable,
                          title: Text(state.customerList[index].name),
                          trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16),
          child: FloatingActionButton(
            onPressed: () {
              context.router.navigate(CustomerScreenRoute());
            },
            child: const Icon(Icons.add_outlined),
          ),
        )
      ],
    );
  }
}
 */
