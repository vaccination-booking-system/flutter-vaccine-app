import 'package:evizy/screen/splash/splash_screen.dart';
import 'package:evizy/view_model/booking_vaccine_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TinjauBookingVaksinScreen extends StatefulWidget {
  final int faskesId;
  final String kategori;
  final String statusHamil;
  final String tanggalVaksin;
  final String waktuVaksin;
  final String tempatVaksin;
  final String nama;
  final String nik;
  final String jenisKelamin;
  final String tanggalLahir;
  final String phoneNumber;
  final String jalan;
  final String provinsi;
  final String kabupaten;
  final String kecamatan;
  final String kelurahan;
  final String rt;
  final String rw;
  final String jalanKtp;
  final String provinsiKtp;
  final String kabupatenKtp;
  final String kecamatanKtp;
  final String kelurahanKtp;
  final String rtKtp;
  final String rwKtp;
  const TinjauBookingVaksinScreen(
      {Key? key,
      required this.kategori,
      required this.statusHamil,
      required this.tanggalVaksin,
      required this.waktuVaksin,
      required this.tempatVaksin,
      required this.nama,
      required this.nik,
      required this.jenisKelamin,
      required this.tanggalLahir,
      required this.phoneNumber,
      required this.jalan,
      required this.provinsi,
      required this.kabupaten,
      required this.kecamatan,
      required this.kelurahan,
      required this.rt,
      required this.rw,
      required this.jalanKtp,
      required this.provinsiKtp,
      required this.kabupatenKtp,
      required this.kecamatanKtp,
      required this.kelurahanKtp,
      required this.rtKtp,
      required this.rwKtp,
      required this.faskesId})
      : super(key: key);

  @override
  State<TinjauBookingVaksinScreen> createState() =>
      _TinjauBookingVaksinScreenState();
}

class _TinjauBookingVaksinScreenState extends State<TinjauBookingVaksinScreen> {
  bool? hamil;

  @override
  void initState() {
    super.initState();
    if (widget.statusHamil == 'ya') {
      hamil = true;
    } else {
      hamil = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingVaccineViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Detail Vaksinasi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Tinjau formulir pendaftaran',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: const [
                    Text(
                      'IDENTITAS',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalDivider(),
                    Icon(Icons.person_outline_rounded),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nik :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.nik,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nama :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.nama,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Jenis Kelamin :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.jenisKelamin,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tanggal Lahir :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.tanggalLahir,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'No Hp :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.phoneNumber,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: const [
                    Text(
                      'ALAMAT',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalDivider(),
                    Icon(Icons.home_outlined),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Berdasarkan KTP :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        widget.jalan,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Domisili :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        widget.jalanKtp,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: const [
                    Text(
                      'KATEGORI',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalDivider(),
                    Icon(Icons.work_sharp),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kategori :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.kategori,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Apakah Hamil? :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.statusHamil,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: const [
                    Text(
                      'JADWAL',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalDivider(),
                    Icon(Icons.schedule_rounded),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tanggal :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.tanggalVaksin,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Jam :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.waktuVaksin,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Lokasi :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.tempatVaksin,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 44,
                ),
                Container(
                  height: 120,
                  width: 345,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 10, 108, 157),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          'Perhatian',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                            'Dengan ini saya menyatakan jawban data diri saya adalah benar dan dapat dipertanggungjawabkan.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 44,
                ),
                ElevatedButton(
                  onPressed: () async {
                    bool isCreated = await bookingProvider.createBookingVaccine(
                        widget.faskesId,
                        widget.kategori,
                        hamil!,
                        widget.jalan,
                        widget.kelurahan,
                        widget.kecamatan,
                        widget.kabupaten,
                        widget.provinsi,
                        widget.jalanKtp,
                        widget.kelurahanKtp,
                        widget.kecamatanKtp,
                        widget.kabupatenKtp,
                        widget.provinsiKtp);
                    if (isCreated) {
                      if (mounted) {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: SingleChildScrollView(
                                child: Column(
                                  children: const [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/checklist.png')),
                                    SizedBox(
                                      height: 46,
                                    ),
                                    Text('Pendaftaran Berhasil'),
                                  ],
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Center(
                                      child: Text(
                                        'Anda Telah Berhasil Melakukan',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Center(
                                        child: Text(
                                      'Pendaftaran Vaksin',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          (context),
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SplashScreen()),
                                          (route) => false);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        )),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(240, 42)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 10, 108, 157))),
                                    child: const Text('Konfirmasi'),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                      minimumSize:
                          MaterialStateProperty.all(const Size(345, 40)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 10, 108, 157))),
                  child: const Text('Daftar Vaksin'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
