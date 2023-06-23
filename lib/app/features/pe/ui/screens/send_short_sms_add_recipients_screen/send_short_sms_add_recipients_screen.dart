import "package:flutter/material.dart";
import "package:revogarageapp/app/features/pe/ui/screens/pick_recipients_group_customer_list/pick_recipients_group_customer_list.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/generated/l10n.dart";

class SendShortSmsAddRecipientsScreen extends StatefulWidget {
  const SendShortSmsAddRecipientsScreen({super.key});

  @override
  State<SendShortSmsAddRecipientsScreen> createState() => _SendShortSmsAddRecipientsScreenState();
}

class _SendShortSmsAddRecipientsScreenState extends State<SendShortSmsAddRecipientsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        RevoScreenHeader(
          title: AppLocalizations.of(context).pick_recipients_or_group,
          actions: TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.current.search,
              prefixIcon: const Icon(
                Icons.search_outlined,
              ),
            ),
          ),
        ),
        const Expanded(child: PickRecipientsGroupCustomerList())
      ],
    );
  }
}
