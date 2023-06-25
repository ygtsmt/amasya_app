import "package:flutter/material.dart";
import "package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart";
import "package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_event.dart";
import "package:revogarageapp/app/ui/widgets/apple_progress_indicator.dart";
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
    return Column(
      children: const [
        RevoScreenHeader(
          title: "Haberler",
        ),
        Expanded(
            child:
                AppleProgressIndicator() /* BlocBuilder<HaberListBloc, HaberListState>(
            builder: (final context, final state) {
              return state.isLoading == true
                  ? const AppleProgressIndicator()
                  : ListView.builder(
                      itemCount: state.haberList.length,
                      itemBuilder: (final context, final index) {
                        return Card(
                          child: ListTile(
                            visualDensity: VisualDensity.comfortable,
                            title: Text(state.haberList[index].baslik),
                            trailing: const Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        );
                      },
                    );
            },
          ), */
            ),
      ],
    );
  }
}
