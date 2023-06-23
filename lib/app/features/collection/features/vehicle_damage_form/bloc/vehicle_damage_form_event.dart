part of "vehicle_damage_form_bloc.dart";

abstract class VehicleDamageFormEvent extends Equatable {
  const VehicleDamageFormEvent();

  @override
  List<Object?> get props => [];
}

class CreateDamageEvent extends VehicleDamageFormEvent {
  const CreateDamageEvent({
    required this.vehicleId,
    required this.name,
    required this.description,
    required this.price,
    required this.photos,
  });
  final int vehicleId;
  final String name;
  final String? description;
  final double price;
  final List<DamagePhotoDto>? photos;

  @override
  List<Object?> get props => [
        vehicleId,
        name,
        description,
        price,
        photos,
      ];
}

class UpdateDamageEvent extends VehicleDamageFormEvent {
  const UpdateDamageEvent(this.damage);

  final VehicleDamageListShortDto damage;

  @override
  List<Object> get props => [damage];
}

class DeleteDamageEvent extends VehicleDamageFormEvent {
  const DeleteDamageEvent(
    this.damageId,
  );
  final int damageId;

  @override
  List<Object> get props => [damageId];
}

class GetDamagePhotosEvent extends VehicleDamageFormEvent {
  const GetDamagePhotosEvent(this.damageId);
  final int damageId;

  @override
  List<Object> get props => [damageId];
}

class AddDamagePhotoEvent extends VehicleDamageFormEvent {
  const AddDamagePhotoEvent(this.damageId, this.photo, this.vehicleId);

  final int vehicleId;
  final int damageId;
  final XFile photo;

  @override
  List<Object> get props => [damageId, photo, vehicleId];
}

class DeleteDamagePhotoEvent extends VehicleDamageFormEvent {
  const DeleteDamagePhotoEvent(this.photoId, this.vehicleId);
  final int photoId;
  final int vehicleId;

  @override
  List<Object> get props => [photoId, vehicleId];
}
