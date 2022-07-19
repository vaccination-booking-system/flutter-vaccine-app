import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/wilayah%20indonesia/kecamatan_model.dart';
import 'package:flutter/cupertino.dart';

class KecamatanViewModel with ChangeNotifier {
  List<KecamatanModel> _kecamatan = [];
  List<KecamatanModel> get kecamatan => _kecamatan;
  final ServiceApi serviceApi = ServiceApi();

  getKecamatan(int id) async {
    try {
      final data = await serviceApi.getKecamatan(id);
      _kecamatan = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
