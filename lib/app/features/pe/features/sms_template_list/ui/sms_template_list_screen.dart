import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/pe/features/sms_template_list/bloc/sms_template_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class SmsTemplateListScreen extends StatefulWidget {
  const SmsTemplateListScreen({super.key});

  @override
  State<SmsTemplateListScreen> createState() => _SmsTemplateListScreenState();
}

class _SmsTemplateListScreenState extends State<SmsTemplateListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<SmsTemplateListBloc>().add(GetSmsTemplateListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).sms_templates,
              actions: TextField(
                onChanged: (final value) {
                  if (value.isEmpty) {
                    getIt<SmsTemplateListBloc>().add(GetSmsTemplateListEvent());
                  } else {
                    getIt<SmsTemplateListBloc>().add(SearchSmsTemplateListEvent(value));
                  }
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.current.search,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SmsTemplateListBloc, SmsTemplateListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.smsTemplateList.length,
                    itemBuilder: (final context, final index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.router.navigate(
                              SmsTemplateFormScreenRoute(smsTemplate: state.smsTemplateList[index]),
                            );
                          },
                          visualDensity: VisualDensity.comfortable,
                          leading: const CircleAvatar(
                            child: Icon(Icons.local_post_office_outlined),
                          ),
                          title: Text(state.smsTemplateList[index].name),
                          trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FloatingActionButton(
                onPressed: () {
                  context.router.push(SmsTemplateFormScreenRoute());
                },
                child: const Icon(Icons.add_outlined),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FilledButton.icon(
                onPressed: () {
                  context.router.push(SendShortSmsScreenRoute());
                },
                icon: const Icon(
                  Icons.sms_outlined,
                ),
                label: Text(
                  AppLocalizations.of(context).send_short_sms,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
