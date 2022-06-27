import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //Global Key untuk Form
  final _formKey = GlobalKey<FormState>();

  //Controller buat Form
  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomorController = TextEditingController();

  //Buat Form Controller
  @override
  void dispose() {
    super.dispose();
    _namaController.dispose();
    _nikController.dispose();
    _nomorController.dispose();
    _tanggalController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.26,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 65,
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
                                if (value!.isEmpty) {
                                  return ("Masukkan Nama anda");
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
                            height: 12,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 24),
                            child: Text(
                              'Tanggal Lahir',
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
                                hintText: 'Tanggal Lahir',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 24),
                            child: Text(
                              'Email',
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
                                hintText: 'Email',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please Enter Your Email");
                                }
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please Enter a valid email");
                                }
                                return null;
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
                                if (value!.isEmpty) {
                                  return ("Masukkan Nomor Telepon anda");
                                }
                                if (value.length <= 11) {
                                  return ("Masukkan Nomor Telepon yang Valid");
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 5.7,
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
                                      Color.fromARGB(255, 10, 108, 157))),
                              child: const Text('Simpan'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                      color: Colors.red,
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
