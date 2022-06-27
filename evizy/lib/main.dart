import 'package:evizy/screen/splash/splash_screen.dart';
import 'package:evizy/screen/streams/login_screen.dart';
import 'package:evizy/view_model/auth_view_model.dart';
import 'package:evizy/view_model/login_view_model.dart';
import 'package:evizy/view_model/register_view_model.dart';
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
    ],
    child: const MaterialApp(
      title: 'Evizy',
      home: SplashScreen(),
    ),
  ));
}
