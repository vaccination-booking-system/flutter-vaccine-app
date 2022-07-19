import 'package:evizy/screen/on%20boarding/on_boarding_screen.dart';
import 'package:evizy/screen/splash/splash_screen.dart';
import 'package:evizy/utils/constant/main_navigator_key.dart';
import 'package:evizy/utils/constant/preferences_key.dart';
import 'package:evizy/view_model/add_family_member_view_model.dart';
import 'package:evizy/view_model/auth_view_model.dart';
import 'package:evizy/view_model/booking_vaccine_view_model.dart';
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
import 'package:evizy/view_model/tiket_vaksin_view_model.dart';
import 'package:evizy/view_model/update_family_member_view_model.dart';
import 'package:evizy/view_model/user_view_model.dart';
import 'package:evizy/view_model/vaccination_session_by_id_view_model.dart';
import 'package:evizy/view_model/vaccination_session_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final onBoarding = prefs.getBool(PreferencesKeys.onBoarding) ?? false;

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
      ChangeNotifierProvider(
        create: (_) => BookingVaccineViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => GetTiketVaksinViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => VaccinationSessionViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => VaccinationSessionByIdViewModel(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: MainNavigasiKey.mainNavigatorKey,
      title: 'Evizy',
      home: onBoarding ? const SplashScreen() : const OnboardingScreen(),
    ),
  ));
}
