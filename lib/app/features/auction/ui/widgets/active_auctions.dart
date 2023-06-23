import "package:flutter/material.dart";
import "package:revogarageapp/generated/l10n.dart";

class ActiveAuctions extends StatelessWidget {
  const ActiveAuctions({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context).active_auctions,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Icon(
              Icons.hide_source,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
