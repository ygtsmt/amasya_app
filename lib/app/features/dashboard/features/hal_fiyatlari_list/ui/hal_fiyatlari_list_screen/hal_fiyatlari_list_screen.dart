import "package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/bloc/hal_fiyatlari_list_bloc.dart";
import "package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/bloc/hal_fiyatlari_list_event.dart";
import "package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/bloc/hal_fiyatlari_list_state.dart";
import "package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart";
import "package:amasyaapp/app/ui/widgets/custom_button.dart";
import 'package:amasyaapp/app/ui/widgets/amasya_screen_header.dart';
import "package:amasyaapp/core/core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:url_launcher/url_launcher.dart";

class HalFiyatlariListScreen extends StatefulWidget {
  const HalFiyatlariListScreen({super.key});

  @override
  State<HalFiyatlariListScreen> createState() => _HalFiyatlariScreenState();
}

class _HalFiyatlariScreenState extends State<HalFiyatlariListScreen> {
  Future<void>? _launched;
  bool _hasCallSupport = false;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
    getIt<HalFiyatlariListBloc>().add(GetHalFiyatlariListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        const AmasyaScreenHeader(
          title: "Hal Fiyatları",
        ),
        Expanded(
          child: BlocBuilder<HalFiyatlariListBloc, HalFiyatlariListState>(
            builder: (final context, final state) {
              return state.isLoading == true
                  ? const AppleProgressIndicator()
                  : ListView.builder(
                      itemCount: state.halFiyatlariList.length,
                      itemBuilder: (final context, final index) {
                        final Uri toLaunch =
                            Uri(scheme: 'https', host: 'amasya.bel.tr', path: state.halFiyatlariList[index].dosya);
                        return CustomButton(
                            onPressed: () => setState(() {
                                  _launched = _launchInBrowser(toLaunch);
                                }),
                            title: state.halFiyatlariList[index].baslik,
                            icon: Icons.download_outlined);
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
