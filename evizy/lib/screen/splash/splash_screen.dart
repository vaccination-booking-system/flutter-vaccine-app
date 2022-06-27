import 'package:evizy/screen/home/home_screen.dart';
import 'package:evizy/screen/streams/login_screen.dart';
import 'package:evizy/utils/constant/preferences_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? _token;

  Future getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(PreferencesKeys.token);
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
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
