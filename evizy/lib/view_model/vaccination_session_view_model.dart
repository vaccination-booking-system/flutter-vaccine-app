import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/vaccine%20session/vaccination_session_model.dart';
import 'package:flutter/cupertino.dart';

class VaccinationSessionViewModel with ChangeNotifier {
  VaccinationSessionModel _vaccinationSession = VaccinationSessionModel();
  VaccinationSessionModel get vaccinationSession => _vaccinationSession;
  final ServiceApi serviceApi = ServiceApi();

  Future getVaccinationSession(int id) async {
    try {
      final data = await serviceApi.getVaccineSession(id);
      _vaccinationSession = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
