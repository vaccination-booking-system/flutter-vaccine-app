import 'package:evizy/screen/profile/ganti_password_screen.dart';
import 'package:evizy/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
                Column(
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
                        children: [
                          const SizedBox(
                            height: 58,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileScreen()));
                            },
                            child: Container(
                              height: 37,
                              width: 345,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: const Text('Profile',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GantiPasswordScreen()));
                            },
                            child: Container(
                              height: 37,
                              width: 345,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: const Text('Kata Sandi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 52,
                    width: 92,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                      color: Color.fromARGB(255, 10, 108, 157),
                    ),
                    child: const Center(
                      child: Text(
                        'Akun',
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
            )
          ],
        ),
      ),
    );
  }
}
