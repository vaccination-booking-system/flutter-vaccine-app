import 'package:evizy/screen/tiket%20vaksin/data_tiket_vaksin_screen.dart';
import 'package:flutter/material.dart';

class TiketVaksinScreen extends StatefulWidget {
  const TiketVaksinScreen({Key? key}) : super(key: key);

  @override
  State<TiketVaksinScreen> createState() => _TiketVaksinScreenState();
}

class _TiketVaksinScreenState extends State<TiketVaksinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Tiket Vaksin',
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
                  image: AssetImage('assets/images/Component9.png'),
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
                  'Lihat Tiket Vaksin Anda',
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
              width: 331,
              child: Center(
                child: Text(
                  'Lihat Tiket Vaksin Anda DImapun Dan Kapanpun.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 10, 108, 157)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 86,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataTiketVaksin()));
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
