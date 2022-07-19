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
        backgroundColor: const Color.fromARGB(255, 10, 108, 157),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Component8.png'),
                  fit: BoxFit.contain,
                ),
                color: Color.fromARGB(255, 10, 108, 157),
              ),
            ),
            const SizedBox(
              height: 53,
            ),
            const SizedBox(
              width: 202,
              child: Center(
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
            const SizedBox(
              width: 286,
              child: Center(
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
