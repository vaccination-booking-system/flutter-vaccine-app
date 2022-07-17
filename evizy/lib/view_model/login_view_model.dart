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
      if (data.message == "SUCCESS") {
        _login = data;
        notifyListeners();
        return true;
      } else if (data.message == "INVALID_CREDENTIALS") {
        Fluttertoast.showToast(msg: 'NIK atau Password salah');
        return false;
      } else {
        Fluttertoast.showToast(msg: 'Ups, Something Went Wrong!');
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error, Please Try Again Later');
      return false;
      // print(e);
    }
  }
}
