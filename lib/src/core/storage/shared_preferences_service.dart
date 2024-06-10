import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SharedPreferencesService {
  Future<void> saveString(String key, String value);
  String? getString(String key);
  Future<void> saveInt(String key, int value);
  int? getInt(String key);
  Future<void> saveBool(String key, bool value);
  bool? getBool(String key);
  Future<void> saveDouble(String key, double value);
  double? getDouble(String key);
  Future<void> saveStringList(String key, List<String> value);
  List<String>? getStringList(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

@Singleton(as: SharedPreferencesService)
class SharedPreferencesServiceImpl implements SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesServiceImpl(this._prefs);

  @override
  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  @override
  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  @override
  Future<void> saveStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  @override
  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
