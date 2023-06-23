import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_list/bloc/right_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class RightListScreen extends StatefulWidget {
  const RightListScreen({super.key});

  @override
  State<RightListScreen> createState() => _RightListScreenState();
}

class _RightListScreenState extends State<RightListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<RightListBloc>().add(GetRightListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).rights,
              actions: TextField(
                onChanged: (final value) {
                  if (value.isEmpty) {
                    getIt<RightListBloc>().add(GetRightListEvent());
                  } else {
                    getIt<RightListBloc>().add(SearchRightListEvent(value));
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
              child: BlocBuilder<RightListBloc, RightListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.rightList.length,
                    itemBuilder: (final context, final index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.router.navigate(
                              RightScreenRoute(
                                right: state.rightList[index],
                              ),
                            );
                          },
                          visualDensity: VisualDensity.comfortable,
                          title: Text(state.rightList[index].name),
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
              context.router.navigate(RightScreenRoute());
            },
            child: const Icon(Icons.add_outlined),
          ),
        )
      ],
    );
  }
}
