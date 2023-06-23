import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/bloc/employee_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<EmployeeListBloc>().add(GetEmployeeListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).employees,
              actions: TextField(
                onChanged: (final value) {
                  if (value.isEmpty) {
                    getIt<EmployeeListBloc>().add(GetEmployeeListEvent());
                  } else {
                    getIt<EmployeeListBloc>().add(SearchEmployeeListEvent(value));
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
              child: BlocBuilder<EmployeeListBloc, EmployeeListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.employeeList.length,
                    itemBuilder: (final context, final index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.router.navigate(
                              EmployeeFormRoute(
                                employeeId: state.employeeList[index].id,
                              ),
                            );
                          },
                          visualDensity: VisualDensity.comfortable,
                          leading: const CircleAvatar(
                            child: Icon(Icons.badge_outlined),
                          ),
                          title: Text("${state.employeeList[index].fullName} "),
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
          child: FloatingActionButton(
            onPressed: () {
              context.router.navigate(EmployeeFormRoute());
            },
            child: const Icon(Icons.add_outlined),
          ),
        )
      ],
    );
  }
}
