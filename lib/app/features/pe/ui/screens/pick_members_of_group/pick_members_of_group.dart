import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/generated/l10n.dart";

class PickMembersOfGroup extends StatefulWidget {
  const PickMembersOfGroup({super.key});

  @override
  State<PickMembersOfGroup> createState() => _PickMembersOfGroupState();
}

class _PickMembersOfGroupState extends State<PickMembersOfGroup> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          RevoScreenHeader(
            title: AppLocalizations.of(context).pick_members_of_the_group,
            actions: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.current.search,
                prefixIcon: const Icon(
                  Icons.search_outlined,
                ),
              ),
            ),
          ),
          if (_selectedIndexes.isNotEmpty)
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_outlined),
                  Text(
                    " ${_selectedIndexes.length} + ${AppLocalizations.of(context).recipients_is_selected}",
                  ),
                ],
              ),
            ),
          Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: firstName.length,
                itemBuilder: (final BuildContext context, final index) {
                  final fullName = "${firstName[index].capitalize()} ${lastName[index].capitalize()}";
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
                        subtitle: const Text("+41234234234"),
                        selected: isSelected,
                        visualDensity: VisualDensity.comfortable,
                        leading: const CircleAvatar(
                          child: Icon(Icons.person_2_outlined),
                        ),
                        title: Text(fullName),
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
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: FilledButton(
                    onPressed: () {
                      if (_selectedIndexes.length < 2) {
                        pleaseSelectLeastMembers();
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context).add_to_group,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void pleaseSelectLeastMembers() {
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
