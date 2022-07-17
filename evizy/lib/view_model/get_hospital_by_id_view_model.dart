import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/hospital/hospital_by_id.dart';
import 'package:flutter/cupertino.dart';

class GetHospitalByIDViewModel with ChangeNotifier {
  HospitalByIdModel _hospital = HospitalByIdModel();
  HospitalByIdModel get hospital => _hospital;
  final ServiceApi serviceApi = ServiceApi();

  Future getHospital(int id) async {
    try {
      final data = await serviceApi.getHospitalById(id);
      _hospital = data;
      print(data.message);
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
