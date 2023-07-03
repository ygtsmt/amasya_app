import 'package:amasyaapp/app/ui/widgets/web_stack.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NobetciEczaneScreen extends StatefulWidget {
  const NobetciEczaneScreen({super.key});

  @override
  State<NobetciEczaneScreen> createState() => _NobetciEczaneScreenState();
}

class _NobetciEczaneScreenState extends State<NobetciEczaneScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.eczaneler.gen.tr/nobetci-amasya'),
      );
  }

  @override
  Widget build(final BuildContext context) {
    return WebViewStack(controller: controller);
  }
}
