import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/bloc/licence_plate_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class LicencePlateListScreen extends StatefulWidget {
  const LicencePlateListScreen({super.key});

  @override
  State<LicencePlateListScreen> createState() => _LicencePlateListScreenState();
}

class _LicencePlateListScreenState extends State<LicencePlateListScreen> {
  @override
  void initState() {
    super.initState();
    getIt<LicencePlateListBloc>().add(GetLicencePlateListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).licence_plates,
              actions: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.current.search,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                  ),
                ),
                onChanged: (final text) {
                  if (text.isEmpty) {
                    getIt<LicencePlateListBloc>().add(GetLicencePlateListEvent());
                  } else {
                    getIt<LicencePlateListBloc>().add(SearchLicencePlateEvent(text));
                  }
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<LicencePlateListBloc, LicencePlateListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.licencePlates.length,
                    itemBuilder: (final context, final index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.router.navigate(
                              LicencePlateFormScreenRoute(
                                licencePlate: state.licencePlates[index],
                              ),
                            );
                          },
                          visualDensity: VisualDensity.comfortable,
                          title: Text(state.licencePlates[index].plate),
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
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FloatingActionButton(
            onPressed: () {
              context.router.navigate(LicencePlateFormScreenRoute());
            },
            child: const Icon(Icons.add_outlined),
          ),
        )
      ],
    );
  }
}
