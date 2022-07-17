import 'package:evizy/screen/splash/splash_screen.dart';
import 'package:evizy/view_model/add_family_member_view_model.dart';
import 'package:evizy/view_model/auth_view_model.dart';
import 'package:evizy/view_model/city_view_model.dart';
import 'package:evizy/view_model/delete_family_member_view_model.dart';
import 'package:evizy/view_model/get_family_member_view_model.dart';
import 'package:evizy/view_model/get_hospital_by_id_view_model.dart';
import 'package:evizy/view_model/hospital_view_model.dart';
import 'package:evizy/view_model/kabupaten_kota_view_model.dart';
import 'package:evizy/view_model/kecamatan_view_model.dart';
import 'package:evizy/view_model/kelurahan_view_model.dart';
import 'package:evizy/view_model/login_view_model.dart';
import 'package:evizy/view_model/provinsi_view_model.dart';
import 'package:evizy/view_model/register_view_model.dart';
import 'package:evizy/view_model/update_family_member_view_model.dart';
import 'package:evizy/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => RegisterViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => AddFamilyMemberViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => GetFamilyMemberViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => UpdateFamilyMemberViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => DeleteFamilyMemberViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => CityViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => HospitalViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => GetHospitalByIDViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProvinsiViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => KabupatenKotaViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => KecamatanViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => KelurahanViewModel(),
      ),
    ],
    child: const MaterialApp(
      title: 'Evizy',
      home: SplashScreen(),
    ),
  ));
}
