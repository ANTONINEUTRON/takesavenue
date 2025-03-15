import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

LocalStorage get appStorage => LocalStorage.instance;

class LocalStorage {
  static LocalStorage? _instance;
  SharedPreferences? _prefs;
  bool _initialized = false;

  // Private constructor
  LocalStorage._();

  // Global instance getter with initialization check
  static LocalStorage get instance {
    if (_instance == null) {
      throw StateError('LocalStorage not initialized. Call LocalStorage.init() first.');
    }
    return _instance!;
  }

  // Initialize SharedPreferences
  static Future<void> init() async {
    if (_instance != null) return;
    
    final prefs = await SharedPreferences.getInstance();
    _instance = LocalStorage._();
    _instance!._prefs = prefs;
    _instance!._initialized = true;
  }

  // Store object
  Future<bool> setObject<T>(String key, T value) async {
    try {
      final String jsonString = json.encode(value);
      return await _prefs?.setString(key, jsonString) ?? false;
    } catch (e) {
      print('Error storing object: $e');
      return false;
    }
  }

  // Get object
  T? getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    try {
      final String? jsonString = _prefs?.getString(key);
      if (jsonString == null) return null;
      
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return fromJson(jsonMap);
    } catch (e) {
      print('Error retrieving object: $e');
      return null;
    }
  }

  // Remove object
  Future<bool> removeObject(String key) async {
    try {
      return await _prefs?.remove(key) ?? false;
    } catch (e) {
      print('Error removing object: $e');
      return false;
    }
  }

  // Clear all storage
  Future<bool> clearStorage() async {
    try {
      return await _prefs?.clear() ?? false;
    } catch (e) {
      print('Error clearing storage: $e');
      return false;
    }
  }

  // Check if key exists
  bool hasKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }
}
