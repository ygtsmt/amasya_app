import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/generated/l10n.dart";

class PeScreen extends StatelessWidget {
  const PeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        RevoScreenHeader(title: AppLocalizations.of(context).pAndE),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
