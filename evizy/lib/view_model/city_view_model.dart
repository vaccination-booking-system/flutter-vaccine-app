import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/city/city_model.dart';
import 'package:flutter/cupertino.dart';

class CityViewModel with ChangeNotifier {
  CityModel _city = CityModel();
  CityModel get city => _city;
  final ServiceApi serviceApi = ServiceApi();

  Future getCity() async {
    try {
      final data = await serviceApi.getCity();
      _city = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
