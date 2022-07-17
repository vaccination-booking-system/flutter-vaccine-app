import 'package:evizy/screen/home/home_screen.dart';
import 'package:evizy/screen/streams/login_screen.dart';
import 'package:evizy/utils/constant/preferences_key.dart';
import 'package:evizy/utils/decode/jwt_decode.dart';
import 'package:evizy/view_model/city_view_model.dart';
import 'package:evizy/view_model/get_family_member_view_model.dart';
import 'package:evizy/view_model/hospital_view_model.dart';
import 'package:evizy/view_model/kabupaten_kota_view_model.dart';
import 'package:evizy/view_model/kecamatan_view_model.dart';
import 'package:evizy/view_model/kelurahan_view_model.dart';
import 'package:evizy/view_model/provinsi_view_model.dart';
import 'package:evizy/view_model/tiket_vaksin_view_model.dart';
import 'package:evizy/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? userId;

  Future getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final JwtDecode jwtDecode = JwtDecode();
    final String data = prefs.get(PreferencesKeys.token).toString();
    print(data);
    final datas = jwtDecode.parseJwt(data);
    userId = datas.values.elementAt(1);
    print(userId);
  }

  String? _token;

  Future getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(PreferencesKeys.token);
    // prefs.remove(PreferencesKeys.token);
    if (_token != null) {
      return Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserId().then((value) {
      Provider.of<GetFamilyMemberViewModel>(context, listen: false)
          .getFamilyMember(userId!);
      Provider.of<UserViewModel>(context, listen: false)
          .getUser(context, userId!);
      Provider.of<CityViewModel>(context, listen: false).getCity();
      Provider.of<HospitalViewModel>(context, listen: false).getHospital(1);
      Provider.of<ProvinsiViewModel>(context, listen: false).getProvinsi();
      Provider.of<KabupatenKotaViewModel>(context, listen: false)
          .getKabupatenKota(11);
      Provider.of<KecamatanViewModel>(context, listen: false)
          .getKecamatan(1101);
      Provider.of<KelurahanViewModel>(context, listen: false)
          .getKelurahan(1101010);
      Provider.of<GetTiketVaksinViewModel>(context, listen: false)
          .getTiketVaksin();
    });
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
