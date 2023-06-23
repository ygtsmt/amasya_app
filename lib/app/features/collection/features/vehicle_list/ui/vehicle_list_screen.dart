import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({super.key});

  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        RevoScreenHeader(
          title: AppLocalizations.of(context).vehicle_service,
        ),
      ],
    );
  }
}
