import 'package:dio/dio.dart';
import 'package:evizy/screen/home/home_screen.dart';
import 'package:evizy/screen/splash/splash_screen2.dart';
import 'package:evizy/screen/streams/register_screen.dart';
import 'package:evizy/view_model/auth_view_model.dart';
import 'package:evizy/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Global Key untuk Form
  final _formKey = GlobalKey<FormState>();

  //Controller buat Form
  final _nikController = TextEditingController();
  final _passwordController = TextEditingController();

  //Untuk show dan hidden password
  bool _passwordVisible = false;

  //Check validasi untuk password
  final RegExp _passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])");
  bool validatePassword(String pass) {
    String password = pass.trim();
    if (_passValid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  //Dapetin warna buat checkbox
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }

  //Buat Form Controller
  @override
  void dispose() {
    super.dispose();
    _nikController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginViewModel>(context);
    final authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 108, 157),
      body: Form(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey, //Key untuk Form
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.14,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Center(
                      child: Text('Masuk',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold))),
                  const SizedBox(
                    height: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('NIK'),
                  ),
                  //Form untuk NIK
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: _nikController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'NIK',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Masukkan NIK anda");
                        }
                        if (value.length != 16) {
                          return ("Enter Valid NIK( 16 Character)");
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Password'),
                  ),
                  //Form untuk password
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Masukkan password anda");
                        }
                        // if (value.length < 8) {
                        //   return ("Enter Valid password(min. 8 Character)");
                        // }
                        // bool result = validatePassword(value);
                        // if (result) {
                        //   return null;
                        // } else {
                        //   return "Gunakan huruf kecil, kapital dan angka";
                        // }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Minimal 8 karakter dengan huruf kapital dan angka.',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //Bagian lupa kata sandi
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 1.8),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text('Lupa Kata Sandi?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 190, 190, 190),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //Button masuk
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final bool isAvailable = await loginProvider.getLogin(
                              _nikController.text, _passwordController.text);
                          if (isAvailable) {
                            if (mounted) {
                              authProvider.setToken(
                                  loginProvider.login.data!.accessToken!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SecondSplashScreen()));
                            }
                          }
                        }
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          minimumSize:
                              MaterialStateProperty.all(const Size(308, 40)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 10, 108, 157))),
                      child: const Text('Masuk'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Buat masuk ke register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum Punya Akun? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                              (route) => false);
                        },
                        child: const Text(
                          'Daftar disini',
                          style: TextStyle(
                              color: Color.fromARGB(255, 190, 190, 190)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
