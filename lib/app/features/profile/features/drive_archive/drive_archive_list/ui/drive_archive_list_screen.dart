import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_list/bloc/drive_archive_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class DriveArchiveListScreen extends StatefulWidget {
  const DriveArchiveListScreen({super.key});

  @override
  State<DriveArchiveListScreen> createState() => _DriveArchiveListScreenState();
}

class _DriveArchiveListScreenState extends State<DriveArchiveListScreen> {
  @override
  void initState() {
    getIt<DriveArchiveListBloc>().add(GetDriveArchiveListEvent());
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
              title: AppLocalizations.of(context).drive_archive,
            ),
            Expanded(
              child: BlocBuilder<DriveArchiveListBloc, DriveArchiveListState>(
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
                            context.router.navigate(DriveArchiveFormScreenRoute(drive: drive));
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
      ],
    );
  }
}
