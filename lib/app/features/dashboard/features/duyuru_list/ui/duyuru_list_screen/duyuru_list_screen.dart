import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/bloc/duyuru_list_bloc.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/bloc/duyuru_list_event.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/bloc/duyuru_list_state.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/ui/components/data_info_card.dart";
import "package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart";
import 'package:amasyaapp/app/ui/widgets/amasya_screen_header.dart';
import "package:amasyaapp/core/core.dart";

class DuyuruListScreen extends StatefulWidget {
  const DuyuruListScreen({super.key});

  @override
  State<DuyuruListScreen> createState() => _DuyuruListScreenState();
}

class _DuyuruListScreenState extends State<DuyuruListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<DuyuruListBloc>().add(GetDuyuruListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        const AmasyaScreenHeader(
          title: "Duyurular",
        ),
        Expanded(
          child: BlocBuilder<DuyuruListBloc, DuyuruListState>(
            builder: (final context, final state) {
              return state.isLoading == true
                  ? const AppleProgressIndicator()
                  : ListView.builder(
                      itemCount: state.duyuruList.length,
                      itemBuilder: (final context, final index) {
                        return DataInfoCard(
                          onPressed: () {
                            context.router.navigate(
                              DuyuruIcerikScreenRoute(parameter: state.duyuruList[index].id),
                            );
                          },
                          imagePath: state.duyuruList[index].gorsel,
                          icon: Icons.abc,
                          baslik: state.duyuruList[index].baslik,
                          icerik: state.duyuruList[index].kisaYazi,
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
