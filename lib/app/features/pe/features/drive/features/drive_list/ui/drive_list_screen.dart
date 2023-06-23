import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/bloc/drive_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/routes.dart";
import "package:revogarageapp/generated/l10n.dart";

class DriveListScreen extends StatefulWidget {
  const DriveListScreen({super.key});

  @override
  State<DriveListScreen> createState() => _DriveListScreenState();
}

class _DriveListScreenState extends State<DriveListScreen> {
  @override
  void initState() {
    getIt<DriveListBloc>().add(GetDriveListEvent());
    super.initState();
  }

  // final bool _switchValue = false;
  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            RevoScreenHeader(
              title: AppLocalizations.of(context).drives,
            ),
            Expanded(
              child: BlocBuilder<DriveListBloc, DriveListState>(
                builder: (final context, final state) {
                  return ListView.builder(
                    itemCount: state.drives?.length ?? 0,
                    itemBuilder: (final BuildContext context, final int index) {
                      final drive = state.drives![index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            drive.vehicleVin,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(drive.licencePlateText),
                          enableFeedback: true,
                          onTap: () {
                            context.router.navigate(DriveFormScreenRoute(drive: drive));
                          },
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(drive.customerName),
                              Text(drive.carTypeText),
                            ],
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: FloatingActionButton(
            onPressed: () {
              context.router.navigate(DriveFormScreenRoute());
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        )
      ],
    );
  }
}
