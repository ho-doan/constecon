import 'package:shared_preferences/shared_preferences.dart';

import 'app_local_key.dart';

class SharedPreferencesRequest<T> {
  SharedPreferencesRequest({required this.key, required this.value});
  final String key;
  final T value;
}

class SharedPreferencesHelper {
  // const SharedPreferencesHelper();
  // static const instance = SharedPreferencesHelper();
  SharedPreferencesHelper._();
  static SharedPreferencesHelper get instance => SharedPreferencesHelper._();

  static late SharedPreferences _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static String getApiTokenKey() {
    try {
      return _pref.getString(AppLocalKey.authKey) ?? '';
    } catch (e) {
      return '';
    }
  }

  static Future<void> setApiTokenKey(String value) {
    return _pref.setString(AppLocalKey.authKey, value);
  }
}
