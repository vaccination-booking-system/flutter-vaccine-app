import 'package:dio/dio.dart';
import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/family%20member%20model/create_family_member_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddFamilyMemberViewModel with ChangeNotifier {
  CreateFamilyMember _familyMember = CreateFamilyMember();
  CreateFamilyMember get familyMember => _familyMember;
  final ServiceApi serviceApi = ServiceApi();

  Future createFamilyMember(String name, String nik, String phone_number,
      String date_of_birth, String gender, String relationship) async {
    try {
      final data = await serviceApi.createFamilyMember(
          name, nik, phone_number, date_of_birth, gender, relationship);
      if (data.message == "SUCCESS") {
        _familyMember = data;
        notifyListeners();
        return true;
      } else if (data.message == "INVALID_NIK") {
        Fluttertoast.showToast(msg: 'NIK tidak valid');
        return false;
      } else {
        Fluttertoast.showToast(msg: 'Ups, Something Went Wrong!');
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error, Please Try Again Later');
      return false;
      // print(e);
    }
  }
}
