import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totem/core/location/models/location_data.dart';
import 'package:totem/core/location/models/nominatim_result.dart';

class PreferencesService {
  final SharedPreferences _prefs;

  static const _keyUserLocation = 'user_location';
  static const _keyThemeMode = 'theme_mode';
  static const _keyNominatimCache = 'nominatim_cache_';
  static const _keyOnboardingCompleted = 'onboarding_completed';

  static const _cacheDuration = Duration(hours: 24);

  PreferencesService(this._prefs);

  Future<void> saveLocation(LocationData location) async {
    await _prefs.setString(_keyUserLocation, jsonEncode(location.toJson()));
  }

  LocationData? getLocation() {
    final json = _prefs.getString(_keyUserLocation);
    if (json == null) return null;

    try {
      return LocationData.fromJson(jsonDecode(json));
    } catch (e) {
      return null;
    }
  }

  Future<void> clearLocation() async {
    await _prefs.remove(_keyUserLocation);
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    await _prefs.setString(_keyThemeMode, mode.name);
  }

  ThemeMode getThemeMode() {
    final value = _prefs.getString(_keyThemeMode);
    if (value == null) return ThemeMode.system;

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setOnboardingCompleted(bool value) async {
    await _prefs.setBool(_keyOnboardingCompleted, value);
  }

  bool isOnboardingCompleted() {
    return _prefs.getBool(_keyOnboardingCompleted) ?? false;
  }

  Future<void> cacheNominatimSearch(
    String query,
    List<NominatimResult> results,
  ) async {
    final cacheData = {
      'timestamp': DateTime.now().toIso8601String(),
      'results': results
          .map(
            (r) => {
              'displayName': r.displayName,
              'lat': r.lat,
              'lon': r.lon,
              'address': r.address,
            },
          )
          .toList(),
    };

    await _prefs.setString(
      '$_keyNominatimCache${query.toLowerCase()}',
      jsonEncode(cacheData),
    );
  }

  List<NominatimResult>? getCachedNominatimSearch(String query) {
    final json = _prefs.getString('$_keyNominatimCache${query.toLowerCase()}');
    if (json == null) return null;

    try {
      final data = jsonDecode(json) as Map<String, dynamic>;
      final timestamp = DateTime.parse(data['timestamp'] as String);

      if (DateTime.now().difference(timestamp) > _cacheDuration) {
        _prefs.remove('$_keyNominatimCache${query.toLowerCase()}');
        return null;
      }

      final results = (data['results'] as List)
          .map(
            (r) => NominatimResult(
              displayName: r['displayName'] as String,
              lat: r['lat'] as double,
              lon: r['lon'] as double,
              address: r['address'] as String?,
            ),
          )
          .toList();

      return results;
    } catch (e) {
      return null;
    }
  }

  Future<void> clearNominatimCache() async {
    final keys = _prefs.getKeys();
    final cacheKeys = keys.where((k) => k.startsWith(_keyNominatimCache));

    for (final key in cacheKeys) {
      await _prefs.remove(key);
    }
  }
}
