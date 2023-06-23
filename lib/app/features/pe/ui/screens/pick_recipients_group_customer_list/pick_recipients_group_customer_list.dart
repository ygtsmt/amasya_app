import "package:flutter/material.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/generated/l10n.dart";

class PickRecipientsGroupCustomerList extends StatefulWidget {
  const PickRecipientsGroupCustomerList({super.key});

  @override
  State<PickRecipientsGroupCustomerList> createState() => _PickRecipientsGroupCustomerListState();
}

class _PickRecipientsGroupCustomerListState extends State<PickRecipientsGroupCustomerList> {
  final List<String> firstName = [
    "timur",
    "cengiz",
    "yavuz",
    "fatih",
    "mustafa",
    "cengiz",
    "yavuz",
    "cengiz",
    "yavuz",
    "cengiz",
    "yavuz",
    "cengiz",
    "mustafa",
  ];

  final List<String> lastName = [
    "yilmaz",
    "arslan",
    "deniz",
    "zorlu",
    "serttas",
    "arslan",
    "deniz",
    "zorlu",
    "arslan",
    "deniz",
    "deniz",
    "arslan",
    "yilmaz",
  ];
  final Set<int> _selectedIndexes = <int>{};

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          children: [
            if (_selectedIndexes.isNotEmpty)
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_outlined),
                    Text(
                      " ${_selectedIndexes.length} ${AppLocalizations.of(context).recipients_is_selected}",
                    ),
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: firstName.length,
                itemBuilder: (final context, final index) {
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
            ),
          ],
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16),
            child: FilledButton(
              onPressed: () {
                if (_selectedIndexes.isEmpty) {
                  showSnackBarUnsupportedFileType();
                }
              },
              child: Text(
                AppLocalizations.of(context).add_recipients,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showSnackBarUnsupportedFileType() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context).please_select_members,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
