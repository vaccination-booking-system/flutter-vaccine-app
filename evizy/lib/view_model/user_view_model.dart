import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/user/user_model.dart';
import 'package:evizy/screen/streams/login_screen.dart';
import 'package:evizy/utils/constant/preferences_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  UserModel _user = UserModel();
  UserModel get user => _user;
  final ServiceApi serviceApi = ServiceApi();

  Future getUser(BuildContext context, int id) async {
    try {
      final data = await serviceApi.getUser(id);
      _user = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode == 401) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove(PreferencesKeys.token);
          Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        } else if (e.response!.statusCode == 403) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove(PreferencesKeys.token);
          Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        }
        e.response!.statusCode;
      }
    }
  }
}
