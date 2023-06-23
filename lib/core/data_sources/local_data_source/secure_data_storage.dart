import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/core/constants.dart";

@singleton
class SecureDataStorage {
  SecureDataStorage(this._storage);
  static String? accessToken;
  static String? refreshToken;

  final FlutterSecureStorage _storage;

  /// Get token from secure storage
  Future<String?> getToken() {
    if (kIsWeb) {
      return Future.value(accessToken);
    }
    return _storage.read(key: authTokenKey);
  }

  /// Save token to secure storage
  Future<void> saveToken(final String? token) async {
    _storage.write(key: authTokenKey, value: token);
    accessToken = token;
  }

  /// Delete token from secure storage
  Future<void> deleteToken() async {
    _storage.delete(key: authTokenKey);
    accessToken = null;
  }

  /// Save refresh token to secure storage
  Future<void> saveRefreshToken(final String token) async {
    _storage.write(key: refreshTokenKey, value: token);
    refreshToken = token;
  }

  /// Get refresh token from secure storage
  Future<String?> getRefreshToken() {
    try {
      return _storage.read(key: refreshTokenKey);
    } catch (e) {
      return Future.value(refreshToken);
    }
  }

  /// Delete refresh token from secure storage
  Future<void> deleteRefreshToken() async {
    _storage.delete(key: refreshTokenKey);
    refreshToken = null;
  }

  /// Delete all data from secure storage
  Future<void> deleteAll() async {
    _storage.deleteAll();
  }

  /// Save theme mode to secure storage
  Future<void> saveThemeMode(final ThemeMode mode) async {
    _storage.write(key: themeMode, value: mode.name);
  }

  /// Get theme mode from secure storage
  Future<ThemeMode> getThemeMode() async {
    final String? mode = await _storage.read(key: themeMode);
    return mode == ThemeMode.light.name ? ThemeMode.light : ThemeMode.dark;
  }
}
