import 'package:evizy/screen/add%20family%20member/add_family_member_screen.dart';
import 'package:flutter/material.dart';

class FamilyMemberScreen extends StatefulWidget {
  const FamilyMemberScreen({Key? key}) : super(key: key);

  @override
  State<FamilyMemberScreen> createState() => _FamilyMemberScreenState();
}

class _FamilyMemberScreenState extends State<FamilyMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Add Family Member',
          style: TextStyle(
            color: Colors.white,
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
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 10, 108, 157),
              ),
            ),
            const SizedBox(
              height: 53,
            ),
            Container(
              width: 202,
              child: const Center(
                child: Text(
                  'Daftarkan Keluarga Anda',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 10, 108, 157)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Container(
              width: 286,
              child: const Center(
                child: Text(
                  'Daftarkan Keluarga Anda , Cukup Dengan Menambahkan Data Diri Mereka.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 10, 108, 157)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 62,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddFamilyMemberScreen()));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                    minimumSize: MaterialStateProperty.all(const Size(172, 54)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 10, 108, 157))),
                child: const Text(
                  'Dapatkan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
