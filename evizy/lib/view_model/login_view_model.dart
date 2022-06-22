import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/citizen/login_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginViewModel with ChangeNotifier {
  LoginModel _login = LoginModel();
  LoginModel get login => _login;
  ServiceApi service = ServiceApi();

  Future<bool> getLogin(String nik, String password) async {
    try {
      final data = await service.postLogin(nik, password);
      _login = data;
      notifyListeners();
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error');
      return false;
      // print(e);
    }
  }
}
