import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/bloc/haber_list_event.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/bloc/haber_list_state.dart";
import "package:amasyaapp/app/features/dashboard/features/haber_list/ui/components/data_info_card.dart";
import "package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart";
import 'package:amasyaapp/app/ui/widgets/amasya_screen_header.dart';
import "package:amasyaapp/core/core.dart";

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
        const AmasyaScreenHeader(
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
                          onPressed: () {
                            context.router.navigate(
                              HaberIcerikScreenRoute(
                                parameter: index
                              ),
                            );
                          },
                          imagePath: state.haberList[index].gorsel,
                          icon: Icons.abc,
                          baslik: state.haberList[index].baslik,
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
