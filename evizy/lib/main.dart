import 'package:evizy/screen/streams/login_screen.dart';
import 'package:evizy/view_model/login_view_model.dart';
import 'package:evizy/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  // var token = prefs.getString(PreferencesKeys.token);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => RegisterViewModel(),
      ),
      // ChangeNotifierProvider(
      //   create: (_) => AuthViewModel(),
      // ),
    ],
    child: const MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
    ),
  ));
}
