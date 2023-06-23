import "package:injectable/injectable.dart";

@injectable
class AccountPermissionService {
  bool hasPermission(final String permission) {
    return true;
  }
}
