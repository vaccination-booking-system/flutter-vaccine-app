import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/vaccine%20session/vaccination_session_by_id_mode.dart';
import 'package:flutter/cupertino.dart';

class VaccinationSessionByIdViewModel with ChangeNotifier {
  VaccinationSessionByIdModel _vaccinationSession =
      VaccinationSessionByIdModel();
  VaccinationSessionByIdModel get vaccinationSession => _vaccinationSession;
  final ServiceApi serviceApi = ServiceApi();

  Future getVaccinationSession(int id) async {
    try {
      final data = await serviceApi.getVaccineSessionById(id);
      _vaccinationSession = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
