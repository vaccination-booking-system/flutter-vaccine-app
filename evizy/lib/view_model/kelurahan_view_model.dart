import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/wilayah%20indonesia/kelurahan.dart';
import 'package:flutter/cupertino.dart';

class KelurahanViewModel with ChangeNotifier {
  List<KelurahanModel> _kelurahan = [];
  List<KelurahanModel> get kelurahan => _kelurahan;
  final ServiceApi serviceApi = ServiceApi();

  getKelurahan(int id) async {
    try {
      final data = await serviceApi.getKelurahan(id);
      _kelurahan = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
