import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/user/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel with ChangeNotifier {
  UserModel _user = UserModel();
  UserModel get user => _user;
  final ServiceApi serviceApi = ServiceApi();

  Future getUser(int id) async {
    try {
      final data = await serviceApi.getUser(id);
      _user = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
