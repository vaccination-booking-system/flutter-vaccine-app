import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GantiPasswordScreen extends StatefulWidget {
  const GantiPasswordScreen({Key? key}) : super(key: key);

  @override
  State<GantiPasswordScreen> createState() => _GantiPasswordScreenState();
}

class _GantiPasswordScreenState extends State<GantiPasswordScreen> {
  //Global Key untuk Form
  final _formKey = GlobalKey<FormState>();

  //Controller buat Form
  final _passwordLamaController = TextEditingController();
  final _passwordBaruController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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

  @override
  void dispose() {
    super.dispose();
    _passwordLamaController.dispose();
    _passwordBaruController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Akun',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 24,
            ),
            Stack(
              children: [
                Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 26,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.26,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 56,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 24),
                              child: Text(
                                'Kata Sandi Lama',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: TextFormField(
                                controller: _passwordLamaController,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
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
                                    return ("Masukkan password lama anda");
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 24),
                              child: Text(
                                'Kata Sandi Baru',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: TextFormField(
                                controller: _passwordLamaController,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
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
                                    return ("Masukkan password baru anda");
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 24),
                              child: Text(
                                'Kata Sandi Baru, Lagi',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: TextFormField(
                                controller: _passwordLamaController,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
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
                                    return ("Masukkan password baru anda");
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    )),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(345, 40)),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 10, 108, 157))),
                                child: const Text('Simpan'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: 52,
                    width: 136,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                      color: Color.fromARGB(255, 10, 108, 157),
                    ),
                    child: const Center(
                      child: Text(
                        'Kata Sandi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
