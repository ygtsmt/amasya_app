import "package:flutter/material.dart";

class RevoScreenHeader extends StatelessWidget {
  const RevoScreenHeader({
    required this.title,
    this.actions,
    super.key,
  });
  final String title;
  final Widget? actions;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          if (actions != null)
            Expanded(
              flex: 3,
              child: Align(alignment: Alignment.bottomRight, child: actions),
            ),
        ],
      ),
    );
  }
}
