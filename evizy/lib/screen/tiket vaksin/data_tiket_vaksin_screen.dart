import 'package:evizy/screen/home/home_screen.dart';
import 'package:evizy/screen/tiket%20vaksin/detail_tiket_vaksin.dart';
import 'package:evizy/view_model/hospital_view_model.dart';
import 'package:evizy/view_model/tiket_vaksin_view_model.dart';
import 'package:evizy/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataTiketVaksin extends StatefulWidget {
  const DataTiketVaksin({Key? key}) : super(key: key);

  @override
  State<DataTiketVaksin> createState() => _DataTiketVaksinState();
}

class _DataTiketVaksinState extends State<DataTiketVaksin> {
  var tiketVaksin;
  int? idFaskes;
  String? alamat;
  String? jamTest;
  String? jamTest2;
  String? faskes;
  String? tanggalTest;

  bool? isAvailable;

  bool getTiket() {
    for (int i = 0;
        i <
            Provider.of<GetTiketVaksinViewModel>(context, listen: false)
                .tiketVaksin
                .data!
                .length;
        i++) {
      if (Provider.of<UserViewModel>(context, listen: false).user.data!.id ==
          Provider.of<GetTiketVaksinViewModel>(context, listen: false)
              .tiketVaksin
              .data![i]
              .registeredBy!
              .id!) {
        tiketVaksin =
            Provider.of<GetTiketVaksinViewModel>(context, listen: false)
                .tiketVaksin
                .data![i];
        alamat = Provider.of<GetTiketVaksinViewModel>(context, listen: false)
            .tiketVaksin
            .data![i]
            .currAddress;
        setState(() {});
        return true;
      }
    }
    return false;
  }

  getData() {
    for (int i = 0;
        i <
            Provider.of<HospitalViewModel>(context, listen: false)
                .hospital
                .data!
                .length;
        i++) {
      if (Provider.of<HospitalViewModel>(context, listen: false)
              .hospital
              .data![i]
              .id ==
          idFaskes) {
        jamTest = Provider.of<HospitalViewModel>(context, listen: false)
            .hospital
            .data![i]
            .scheduleTimeStart;
        jamTest2 = Provider.of<HospitalViewModel>(context, listen: false)
            .hospital
            .data![i]
            .scheduleTimeEnd;
        faskes = Provider.of<HospitalViewModel>(context, listen: false)
            .hospital
            .data![i]
            .healthFacility!
            .name;
        tanggalTest = Provider.of<HospitalViewModel>(context, listen: false)
            .hospital
            .data![i]
            .scheduleDate;
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      isAvailable = getTiket();
      setState(() {
        idFaskes = tiketVaksin.vaccinationSession!.id;
        setState(() {
          getData();
        });
      });
    });
  }

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
          'Tiket Vaksin',
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
            const SizedBox(
              height: 180,
            ),
            isAvailable == true
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.561,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTiketVaksin(
                                          alamat: tiketVaksin.currAddress,
                                          jamTest: '$jamTest-$jamTest2',
                                          jenisKelamin:
                                              userProvider.user.data!.gender!,
                                          lokasi: faskes!,
                                          nama: userProvider.user.data!.name!,
                                          nik: userProvider.user.data!.nik!,
                                          nomorTiket: tiketVaksin.id,
                                          tanggalLahir: userProvider
                                              .user.data!.dateOfBirth!,
                                          tanggalTest: tanggalTest!,
                                        )));
                          },
                          child: Container(
                            height: 56,
                            width: 345,
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                              child: Text(userProvider.user.data!.name!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        const Text(
                          'Oops, Anda Belum',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'Mempunyai Tiket Vaksin',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Silahkan Lakukan Pendaftaran Vaksin',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          'SUntuk Mendapatkan Tiket Vaksin',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 216,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                                (route) => false);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(345, 40)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 10, 108, 157))),
                          child: const Text('Kembali Ke Beranda'),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
