import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefenceService {
  static SharedPreferences? _prefs;

  static Future<void> initializeSharedPrefence() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get prefs => _prefs;

  static bool hasAuthId() {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call initializeSharedPreference() first.");
    }

    String? authId = _prefs!.getString("authId");
    return authId != null && authId.isNotEmpty;
  }


}
