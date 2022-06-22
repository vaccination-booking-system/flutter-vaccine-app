import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/citizen/register_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterViewModel with ChangeNotifier {
  RegisterModel _login = RegisterModel();
  RegisterModel get login => _login;
  ServiceApi service = ServiceApi();

  Future<bool> getRegister(
      String name, String nik, String phoneNumber, String password) async {
    try {
      final data = await service.postRegister(name, nik, phoneNumber, password);
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
