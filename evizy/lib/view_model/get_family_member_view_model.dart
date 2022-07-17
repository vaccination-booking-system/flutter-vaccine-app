import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/family%20member%20model/family_member_model.dart';
import 'package:flutter/cupertino.dart';

class GetFamilyMemberViewModel with ChangeNotifier {
  FamilyMemberModel _familyMember = FamilyMemberModel();
  FamilyMemberModel get familyMember => _familyMember;
  final ServiceApi serviceApi = ServiceApi();

  Future getFamilyMember(int id) async {
    try {
      final data = await serviceApi.getFamilyMember(id);
      _familyMember = data;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
