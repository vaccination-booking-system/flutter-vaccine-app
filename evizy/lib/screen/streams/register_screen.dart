import 'package:evizy/screen/home/home_screen.dart';
import 'package:evizy/screen/streams/login_screen.dart';
import 'package:evizy/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Global Key untuk Form
  final _formKey = GlobalKey<FormState>();

  //Controller buat Form
  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _nomorController = TextEditingController();
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

  //Buat Form Controller
  @override
  void dispose() {
    super.dispose();
    _namaController.dispose();
    _nikController.dispose();
    _nomorController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterViewModel>(context);
    //Width
    var width = MediaQuery.of(context).size.width / 1.14;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 108, 157),
      body: SafeArea(
        child: Form(
            key: _formKey, //Global Form Key
            child: Center(
              child: Container(
                width: width,
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
                      Center(
                        child: Text('Buat Akun Baru',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          'Nama Lengkap',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      //Form untuk nama
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          controller: _namaController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Nama Lengkap',
                          ),
                          validator: (value) {
                            final RegExp nameRegExp = RegExp(
                                r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
                            if (value!.isEmpty) {
                              return ("Masukkan Nama anda");
                            }
                            if (nameRegExp.hasMatch(value)) {
                              return ("Masukkan Nama yang valid");
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          'Nomor Induk Kependudukan',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      //Form untuk NIK
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          controller: _nikController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Nomor Induk Kependudukan',
                          ),
                          validator: (value) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{16}$)';
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty) {
                              return ("Masukkan NIK anda");
                            }
                            if (!regExp.hasMatch(value)) {
                              return ("Masukkan NIK yang valid");
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          'Nomor Telepon',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      //Form untuk nomor telepon
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          controller: _nomorController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: 'Nomor Telepon',
                          ),
                          validator: (value) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty) {
                              return ("Masukkan Nomor Telepon anda");
                            }
                            if (!regExp.hasMatch(value)) {
                              return ("Masukkan Nomor Telepon yang Valid");
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      //Form untuk password
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
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
                            if (value.length < 8) {
                              return ("Enter Valid password(min. 8 Character)");
                            }
                            bool result = validatePassword(value);
                            if (result) {
                              return null;
                            } else {
                              return "Gunakan huruf kecil, kapital dan angka";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Button daftar
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool isAvailable =
                                  await registerProvider.getRegister(
                                      _namaController.text,
                                      _nikController.text,
                                      _nomorController.text,
                                      _passwordController.text);
                              if (isAvailable) {
                                if (mounted) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()));
                                }
                              }
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(297, 39)),
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 10, 108, 157))),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //Buat kembali ke login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sudah Punya Akun? ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            },
                            child: const Text(
                              'Masuk disini',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 190, 190, 190)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
