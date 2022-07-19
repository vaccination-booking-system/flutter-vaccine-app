import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/family%20member%20model/delete_family_member_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteFamilyMemberViewModel with ChangeNotifier {
  DeleteFamilyMember _familyMember = DeleteFamilyMember();
  DeleteFamilyMember get familyMember => _familyMember;
  final ServiceApi serviceApi = ServiceApi();

  Future deleteFamilyMember(int id) async {
    try {
      final data = await serviceApi.deleteFamilyMember(id);
      if (data.message == "SUCCESS") {
        _familyMember = data;
        notifyListeners();
        return true;
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
