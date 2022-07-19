import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/tiket%20vaksin/tiket_vaksin_model.dart';
import 'package:flutter/cupertino.dart';

class GetTiketVaksinViewModel with ChangeNotifier {
  TiketVaksineModel _tiketVaksin = TiketVaksineModel();
  TiketVaksineModel get tiketVaksin => _tiketVaksin;
  final ServiceApi serviceApi = ServiceApi();

  Future getTiketVaksin(int id) async {
    try {
      final data = await serviceApi.getTiketVaksin(id);
      _tiketVaksin = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
