import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart";
import "package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_event.dart";
import "package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_state.dart";
import "package:revogarageapp/app/ui/widgets/apple_progress_indicator.dart";
import "package:revogarageapp/app/ui/widgets/data_info_card.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/core.dart";

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
      children: [
        const RevoScreenHeader(
          title: "Haberler",
        ),
        Expanded(
          child: BlocBuilder<HaberListBloc, HaberListState>(
            builder: (final context, final state) {
              return state.isLoading == true
                  ? const AppleProgressIndicator()
                  : ListView.builder(
                      itemCount: state.haberList.length,
                      itemBuilder: (final context, final index) {
                        return DataInfoCard(
                          onPressed: () {},
                          imagePath: state.haberList[index].gorsel,
                          icon: Icons.abc,
                          // icerik: state.haberList[index].aciklama,
                          baslik: state.haberList[index].baslik,
                        );
                        //Text("https://amasya.bel.tr/${state.haberList[index].gorsel}");
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
