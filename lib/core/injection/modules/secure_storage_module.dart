import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:injectable/injectable.dart";

@module
@singleton
abstract class SecureStorageModule {
  @singleton
  FlutterSecureStorage storage() => const FlutterSecureStorage();
}
