import 'package:evizy/screen/tiket%20vaksin/data_tiket_vaksin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TiketVaksinScreen extends StatefulWidget {
  const TiketVaksinScreen({Key? key}) : super(key: key);

  @override
  State<TiketVaksinScreen> createState() => _TiketVaksinScreenState();
}

class _TiketVaksinScreenState extends State<TiketVaksinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: IconThemeData(
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 10, 108, 157),
              ),
            ),
            SizedBox(
              height: 53,
            ),
            Container(
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
            SizedBox(
              height: 19,
            ),
            Container(
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
            SizedBox(
              height: 86,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataTiketVaksin()));
                  Fluttertoast.showToast(msg: 'Under Development');
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                    minimumSize: MaterialStateProperty.all(const Size(172, 54)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 10, 108, 157))),
                child: Text(
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
