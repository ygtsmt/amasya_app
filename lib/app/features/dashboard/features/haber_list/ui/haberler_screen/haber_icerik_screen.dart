import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amasyaapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart';
import 'package:amasyaapp/app/features/dashboard/features/haber_list/bloc/haber_list_state.dart';
import 'package:amasyaapp/app/features/dashboard/features/haber_list/ui/components/haber_icerik_card.dart';
import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:amasyaapp/app/ui/widgets/amasya_screen_header.dart';

class HaberIcerikScreen extends StatefulWidget {
  final int parameter;

  const HaberIcerikScreen({Key? key, required this.parameter}) : super(key: key);

  @override
  State<HaberIcerikScreen> createState() => _HaberIcerikScreenState();
}

class _HaberIcerikScreenState extends State<HaberIcerikScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AmasyaScreenHeader(
          title: "Haber İçeriği",
        ),
        Expanded(
          child: BlocBuilder<HaberListBloc, HaberListState>(
            builder: (final context, final state) {
              return state.isLoading == true
                  ? const AppleProgressIndicator()
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (final context, final index) {
                        return HaberIcerikCard(
                          imagePath: state.haberList[widget.parameter].gorsel,
                          icerik: state.haberList[widget.parameter].aciklama,
                          baslik: state.haberList[widget.parameter].baslik,
                          kisaAciklama: state.haberList[widget.parameter].kisaYazi,
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
