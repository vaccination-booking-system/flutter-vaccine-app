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
      if (data.message == "SUCCESS") {
        _login = data;
        notifyListeners();
        return true;
      } else if (data.message == "ALREADY_EXIST") {
        Fluttertoast.showToast(msg: 'NIK Sudah Tersedia');
        return false;
      } else if (data.message == "INVALID_NIK") {
        Fluttertoast.showToast(msg: 'NIK Invalid');
        return false;
      } else {
        Fluttertoast.showToast(msg: 'Unknown Error');
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error');
      return false;
      // print(e);
    }
  }
}
