import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/wilayah%20indonesia/provinsi_model.dart';
import 'package:flutter/cupertino.dart';

class ProvinsiViewModel with ChangeNotifier {
  List<ProvinsiModel> _provinsi = [];
  List<ProvinsiModel> get provinsi => _provinsi;
  final ServiceApi serviceApi = ServiceApi();

  getProvinsi() async {
    try {
      final data = await serviceApi.getProvinsi();
      _provinsi = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
