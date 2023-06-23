import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class CheckGroupsScreen extends StatefulWidget {
  const CheckGroupsScreen({super.key});

  @override
  State<CheckGroupsScreen> createState() => _CheckGroupsScreenState();
}

class _CheckGroupsScreenState extends State<CheckGroupsScreen> {
  final List<String> firstName = [
    "timur",
    "cengiz",
    "yavuz",
    "fatih",
    "mustafa",
    "cengiz",
  ];

  final List<String> lastName = [
    "yilmaz",
    "arslan",
    "deniz",
    "zorlu",
    "serttas",
    "arslan",
  ];
  final Set<int> _selectedIndexes = <int>{};

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).sms_groups,
              actions: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.current.search,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (final context, final index) {
                  final isSelected = _selectedIndexes.contains(index);

                  return Card(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedIndexes.remove(index);
                          } else {
                            _selectedIndexes.add(index);
                          }
                        });
                      },
                      child: ListTile(
                        selected: isSelected,
                        visualDensity: VisualDensity.comfortable,
                        leading: const CircleAvatar(
                          child: Icon(Icons.groups_outlined),
                        ),
                        title: Text("Group Name ${index + 1}"),
                        trailing: isSelected
                            ? const Icon(
                                Icons.check_outlined,
                              )
                            : const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FloatingActionButton(
                onPressed: () {
                  context.router.navigate(const CreateSmsGroupScreenRoute());
                },
                child: const Icon(Icons.add_outlined),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: FilledButton(
                  onPressed: () {
                    //  context.router.pop();
                  },
                  child: Text(
                    AppLocalizations.of(context).add_as_recipients,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void showSnackBarUnsupportedFileType() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context).please_select_at_least_to_members_to_create_group,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
