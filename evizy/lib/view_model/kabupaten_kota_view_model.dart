import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/wilayah%20indonesia/kabupaten_kota_model.dart';
import 'package:flutter/cupertino.dart';

class KabupatenKotaViewModel with ChangeNotifier {
  List<KabupatenKotaModel> _kabupatenKota = [];
  List<KabupatenKotaModel> get kabupatenKota => _kabupatenKota;
  final ServiceApi serviceApi = ServiceApi();

  getKabupatenKota(int id) async {
    try {
      final data = await serviceApi.getKabupatenKota(id);
      _kabupatenKota = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
