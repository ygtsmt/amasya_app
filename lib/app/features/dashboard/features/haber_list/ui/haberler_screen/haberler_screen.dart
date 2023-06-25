import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart";
import "package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_event.dart";
import "package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_state.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";

class HaberListScreen extends StatefulWidget {
  const HaberListScreen({super.key});

  @override
  State<HaberListScreen> createState() => _HaberListScreenState();
}

class _HaberListScreenState extends State<HaberListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<HaberListBloc>().add(GetHaberListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            const RevoScreenHeader(
              title: "Haberler",
            ),
            Expanded(
              child: BlocBuilder<HaberListBloc, HaberListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.haberList.length,
                    itemBuilder: (final context, final index) {
                      return Card(
                        child: ListTile(
                          /* onTap: () {
                            context.router.navigate(
                              RightScreenRoute(
                                hab: state.haberList[index],
                              ),
                            );
                          }, */
                          visualDensity: VisualDensity.comfortable,
                          title: Text(state.haberList[index].baslik),
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
              //   context.router.navigate(RightScreenRoute());
            },
            child: const Icon(Icons.add_outlined),
          ),
        )
      ],
    );
  }
}
