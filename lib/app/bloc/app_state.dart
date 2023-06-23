part of "app_bloc.dart";

class AppState extends Equatable {
  const AppState({
    this.themeMode = ThemeMode.dark,
    this.garage,
    this.account,
    this.accountPermissions,
    this.hasCollectionAccess = false,
    this.hasAuctionAccess = false,
    this.hasPeAccess = false,
    this.deleteAccountEventStatus = EventStatus.idle,
  });

  final ThemeMode themeMode;
  final Garage? garage;
  final Account? account;
  final List<AccountPermissionDto>? accountPermissions;
  final bool hasCollectionAccess;
  final bool hasAuctionAccess;
  final bool hasPeAccess;
  final EventStatus deleteAccountEventStatus;

  AppState copyWith({
    final ThemeMode? themeMode,
    final Garage? garage,
    final Account? account,
    final List<AccountPermissionDto>? accountPermissions,
    final bool? hasCollectionAccess,
    final bool? hasAuctionAccess,
    final bool? hasPeAccess,
    final EventStatus? deleteAccountEventStatus,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      garage: garage ?? this.garage,
      account: account ?? this.account,
      accountPermissions: accountPermissions ?? this.accountPermissions,
      hasCollectionAccess: hasCollectionAccess ?? this.hasCollectionAccess,
      hasAuctionAccess: hasAuctionAccess ?? this.hasAuctionAccess,
      hasPeAccess: hasPeAccess ?? this.hasPeAccess,
      deleteAccountEventStatus: deleteAccountEventStatus ?? this.deleteAccountEventStatus,
    );
  }

  @override
  List<Object?> get props =>
      [themeMode, garage, account, accountPermissions, hasCollectionAccess, hasAuctionAccess, deleteAccountEventStatus];
}
