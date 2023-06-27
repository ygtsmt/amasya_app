import "package:flutter/material.dart";
import "package:amasyaapp/generated/l10n.dart";

class UserSummaryScreen extends StatelessWidget {
  const UserSummaryScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Text(AppLocalizations.of(context).user_summary_screen);
  }
}
