import 'package:flutter/material.dart';
import 'package:revogarageapp/app/ui/widgets/web_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DuyuruIcerikScreen extends StatefulWidget {
  const DuyuruIcerikScreen({required this.parameter, Key? key}) : super(key: key);

  final int parameter;

  @override
  State<DuyuruIcerikScreen> createState() => _DuyuruIcerikScreenState();
}

class _DuyuruIcerikScreenState extends State<DuyuruIcerikScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://amasya.bel.tr/basin-odasi/ilan/${widget.parameter}'),
      );
  }

  @override
  Widget build(final BuildContext context) {
    return WebViewStack(controller: controller );
  }
}