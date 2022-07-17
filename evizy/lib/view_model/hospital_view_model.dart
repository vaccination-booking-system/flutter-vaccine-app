import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/hospital/hospital_model.dart';
import 'package:flutter/cupertino.dart';

class HospitalViewModel with ChangeNotifier {
  HospitalModel _hospital = HospitalModel();
  HospitalModel get hospital => _hospital;
  final ServiceApi serviceApi = ServiceApi();

  Future getHospital(int id) async {
    try {
      final data = await serviceApi.getHospital(id);
      _hospital = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
