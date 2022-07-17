import 'package:evizy/screen/profile/account_screen.dart';
import 'package:evizy/screen/profile/faq_screen.dart';
import 'package:evizy/screen/profile/riwayat_test_covid_screen.dart';
import 'package:evizy/screen/profile/tentang_kami_screen.dart';
import 'package:evizy/screen/streams/login_screen.dart';
import 'package:evizy/utils/constant/preferences_key.dart';
import 'package:evizy/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Akun',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                userProvider.user.data!.name!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                userProvider.user.data!.phoneNumber!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 56,
                width: 345,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.transparent),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const RiwayatTestCovidScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.history_rounded),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Riwayat Test Covid-19"),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 56,
                width: 345,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.transparent),
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.file_copy),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Sertifikat Vaksin"),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 56,
                width: 345,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.transparent),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FAQScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star_outline),
                            SizedBox(
                              width: 8,
                            ),
                            Text("FAQ"),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 56,
                width: 345,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.transparent),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TentangKamiScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.people_alt),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Tentang Kami"),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 56,
                width: 345,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.transparent),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccountScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.settings_rounded),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Akun"),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove(PreferencesKeys.token);
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false);
                },
                child: Container(
                  height: 56,
                  width: 345,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.logout_rounded),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Keluar"),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
