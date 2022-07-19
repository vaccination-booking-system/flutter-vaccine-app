import 'package:evizy/screen/booking%20vaccine/pilih_peserta_vaksin_screen.dart';
import 'package:flutter/material.dart';

class BookingVaccine extends StatelessWidget {
  const BookingVaccine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Booking Vaccine',
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
              width: MediaQuery.of(context).size.width,
              height: 320,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Component7.png'),
                  fit: BoxFit.fill,
                ),
                color: Color.fromARGB(255, 10, 108, 157),
              ),
            ),
            const SizedBox(
              height: 53,
            ),
            const SizedBox(
              width: 285,
              child: Center(
                child: Text(
                  'Daftar Vaksin Online',
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
              width: 290,
              child: Center(
                child: Text(
                  'Lakukan Pendaftaran Vaksin Secara Online, Lalu Sesuaikan Jenis Vaksin Dan Jadwal Yang Anda Inginkan.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 10, 108, 157)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 76,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PilihPesertaVaksinScreen()));
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
                )),
          ],
        ),
      ),
    );
  }
}
