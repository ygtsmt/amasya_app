import "dart:convert";

import "package:floating_action_bubble/floating_action_bubble.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_photo/bloc/vehicle_photo_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/core/services/image_picker_service.dart";
import "package:revogarageapp/generated/l10n.dart";

class VehiclePhotoScreen extends StatefulWidget {
  const VehiclePhotoScreen({required this.vehicleId, super.key});
  final int vehicleId;

  @override
  State<VehiclePhotoScreen> createState() => _VehiclePhotoScreenState();
}

class _VehiclePhotoScreenState extends State<VehiclePhotoScreen> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    getIt<VehiclePhotoBloc>().add(GetVehiclePhotosEvent(vehicleId: widget.vehicleId));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  Future<void> multiImagePicker() async {
    getIt<ImagePickerService>().pickMultiImage().then((final List<XFile> images) {
      for (var i = 0; i < images.length; i++) {
        final image = images[i];
        getIt<VehiclePhotoBloc>().add(AddVehiclePhotoEvent(file: image, vehicleId: widget.vehicleId));
      }
    });
  }

  Future<void> takePhoto() async {
    getIt<ImagePickerService>().takePhoto().then((final XFile? image) {
      if (image == null) {
        return;
      }
      getIt<VehiclePhotoBloc>().add(AddVehiclePhotoEvent(file: image, vehicleId: widget.vehicleId));
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        RevoScreenHeader(
          title: AppLocalizations.of(context).vehicle_photos,
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              BlocConsumer<VehiclePhotoBloc, VehiclePhotoState>(
                listener: (final context, final state) {},
                builder: (final context, final state) {
                  if (state.status == EventStatus.processing) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.vehiclePhotos == null || state.vehiclePhotos!.isEmpty) {
                    return Center(
                      child: Text(AppLocalizations.of(context).no_photos),
                    );
                  }

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                    ),
                    itemCount: state.vehiclePhotos!.length,
                    itemBuilder: (final BuildContext context, final int index) {
                      final vehiclePhoto = state.vehiclePhotos![index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.memory(
                                gaplessPlayback: true,
                                base64Decode(vehiclePhoto.base64),
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                left: 4,
                                bottom: 4,
                                child: Opacity(
                                  opacity: vehiclePhoto.isDefault ? 1 : 0.5,
                                  child: Card(
                                    child: IconButton(
                                      onPressed: () {
                                        getIt<VehiclePhotoBloc>().add(
                                          SetDefaultVehiclePhotoEvent(
                                            vehiclePhotoId: vehiclePhoto.id,
                                            vehicleId: widget.vehicleId,
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.star),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 4,
                                bottom: 4,
                                child: Card(
                                  child: IconButton(
                                    onPressed: () {
                                      getIt<VehiclePhotoBloc>().add(
                                        DeleteVehiclePhotoEvent(
                                          vehicleId: widget.vehicleId,
                                          vehiclePhotoId: vehiclePhoto.id,
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: FloatingActionBubble(
                  items: <Bubble>[
                    Bubble(
                      title: AppLocalizations.of(context).upload_photo,
                      iconColor: Theme.of(context).colorScheme.secondary,
                      bubbleColor: Theme.of(context).colorScheme.secondaryContainer,
                      icon: Icons.photo_album_outlined,
                      titleStyle: Theme.of(context).textTheme.titleMedium!,
                      onPress: () {
                        multiImagePicker();
                        _animationController?.reverse();
                      },
                    ),
                    Bubble(
                      title: AppLocalizations.of(context).take_photo,
                      iconColor: Theme.of(context).colorScheme.secondary,
                      bubbleColor: Theme.of(context).colorScheme.secondaryContainer,
                      icon: Icons.photo_camera_outlined,
                      titleStyle: Theme.of(context).textTheme.titleMedium!,
                      onPress: () {
                        takePhoto();
                        _animationController?.reverse();
                      },
                    ),
                  ],
                  animation: _animation,
                  onPress: () => _animationController!.isCompleted
                      ? _animationController?.reverse()
                      : _animationController?.forward(),
                  backGroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  iconColor: Theme.of(context).colorScheme.secondary,
                  iconData: Icons.add,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
