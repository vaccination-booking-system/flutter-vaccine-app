import 'package:evizy/utils/constant/preferences_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  SharedPreferences? _prefs;
  String? _token;

  Future getToken() async {
    _prefs = await SharedPreferences.getInstance();
    _token = _prefs!.getString(PreferencesKeys.token)!;
    notifyListeners();
    return _token;
  }

  Future setToken(String token) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs!.setString(PreferencesKeys.token, token);
    notifyListeners();
  }

  Future setNik(String nik) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs!.setString(PreferencesKeys.nik, nik);
    notifyListeners();
  }

  Future setPass(String pass) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs!.setString(PreferencesKeys.password, pass);
    notifyListeners();
  }

  checkToken() async {}
}
