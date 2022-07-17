import 'package:evizy/model/hospital/hospital_by_id.dart';
import 'package:evizy/screen/booking%20vaccine/tinjau_booking_vaccine_screen.dart';
import 'package:evizy/view_model/city_view_model.dart';
import 'package:evizy/view_model/get_hospital_by_id_view_model.dart';
import 'package:evizy/view_model/hospital_view_model.dart';
import 'package:evizy/view_model/kabupaten_kota_view_model.dart';
import 'package:evizy/view_model/kecamatan_view_model.dart';
import 'package:evizy/view_model/kelurahan_view_model.dart';
import 'package:evizy/view_model/provinsi_view_model.dart';
import 'package:evizy/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum YesOrNo { ya, tidak }

class LangkahBookingVaksin extends StatefulWidget {
  const LangkahBookingVaksin({Key? key}) : super(key: key);

  @override
  State<LangkahBookingVaksin> createState() => _LangkahBookingVaksinState();
}

class _LangkahBookingVaksinState extends State<LangkahBookingVaksin> {
  int _index = 0;

  //Global Key untuk Form
  final _formKey = GlobalKey<FormState>();

  //Controller buat Form
  TextEditingController _kategoriController = TextEditingController();

  TextEditingController _jalanController = TextEditingController();
  TextEditingController _jalanKtpController = TextEditingController();

  TextEditingController _namaController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _nomorController = TextEditingController();

  TextEditingController _rtController = TextEditingController();
  TextEditingController _rwController = TextEditingController();
  TextEditingController _rtKtpController = TextEditingController();
  TextEditingController _rwKtpController = TextEditingController();

  //Buat Form Controller
  @override
  void dispose() {
    super.dispose();
    _kategoriController.dispose();
    _jalanController.dispose();
    _jalanKtpController.dispose();
    _namaController.dispose();
    _nikController.dispose();
    _tanggalLahirController.dispose();
    _nomorController.dispose();
    _rtController.dispose();
    _rwController.dispose();
    _rtKtpController.dispose();
    _rwKtpController.dispose();
  }

  bool isChecked = false;

  YesOrNo? _character;
  String? statusHamil;

  String dropdownJenisKelamin = 'Jenis Kelamin Anda';
  String dropdownKategori = 'Pilih Kategori Anda';
  String dropdownKota = 'Pilih Kota';
  String dropdownVaskes = 'Pilih Faskes';
  String dropdownProvinsi = 'Pilih Provinsi';
  String dropdownKabupatenKota = 'Pilih Kabupaten';
  String dropdownKecamatan = 'Pilih Kecamatan';
  String dropdownKelurahan = 'Pilih Kelurahan';
  String dropdownProvinsiKtp = 'Pilih Provinsi Domisili';
  String dropdownKabupatenKotaKtp = 'Pilih Kabupaten Domisili';
  String dropdownKecamatanKtp = 'Pilih Kecamatan Domisili';
  String dropdownKelurahanKtp = 'Pilih Kelurahan Domisili';

  HospitalByIdModel? sesiHospital;

  List<DropdownMenuItem<String>> get dropdownItemsCity {
    List<DropdownMenuItem<String>> menuItems = [];
    final cityProvider = Provider.of<CityViewModel>(context);
    for (int i = 0; i < cityProvider.city.data!.length; i++) {
      final data = DropdownMenuItem(
          value: cityProvider.city.data![i].name!,
          child: Text(cityProvider.city.data![i].name!));
      menuItems.add(data);
    }
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsFaskes {
    List<DropdownMenuItem<String>> menuItems = [];
    final hospitalProvider = Provider.of<HospitalViewModel>(context);
    for (int i = 0; i < hospitalProvider.hospital.data!.length; i++) {
      final data = DropdownMenuItem(
          value: hospitalProvider.hospital.data![i].healthFacility!.name!,
          child:
              Text(hospitalProvider.hospital.data![i].healthFacility!.name!));
      menuItems.add(data);
    }
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsProvinsi {
    List<DropdownMenuItem<String>> menuItems = [];
    final provinsiProvider = Provider.of<ProvinsiViewModel>(context);
    for (int i = 0; i < provinsiProvider.provinsi.length; i++) {
      final data = DropdownMenuItem(
          value: provinsiProvider.provinsi[i].name,
          child: Text(provinsiProvider.provinsi[i].name!));
      menuItems.add(data);
    }
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsKabupatenKota {
    List<DropdownMenuItem<String>> menuItems = [];
    final kabupatenProvider = Provider.of<KabupatenKotaViewModel>(context);
    for (int i = 0; i < kabupatenProvider.kabupatenKota.length; i++) {
      final data = DropdownMenuItem(
          value: kabupatenProvider.kabupatenKota[i].name,
          child: Text(kabupatenProvider.kabupatenKota[i].name!));
      menuItems.add(data);
    }
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsKecamatan {
    List<DropdownMenuItem<String>> menuItems = [];
    final kecamatanProvider = Provider.of<KecamatanViewModel>(context);
    for (int i = 0; i < kecamatanProvider.kecamatan.length; i++) {
      final data = DropdownMenuItem(
          value: kecamatanProvider.kecamatan[i].name,
          child: Text(kecamatanProvider.kecamatan[i].name!));
      menuItems.add(data);
    }
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsKelurahan {
    List<DropdownMenuItem<String>> menuItems = [];
    final kelurahanProvider = Provider.of<KelurahanViewModel>(context);
    for (int i = 0; i < kelurahanProvider.kelurahan.length; i++) {
      final data = DropdownMenuItem(
          value: kelurahanProvider.kelurahan[i].name,
          child: Text(kelurahanProvider.kelurahan[i].name!));
      menuItems.add(data);
    }
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityViewModel>(context);
    final hospitalProvider = Provider.of<HospitalViewModel>(context);
    final provinsiProvider = Provider.of<ProvinsiViewModel>(context);
    final kabupatenProvider = Provider.of<KabupatenKotaViewModel>(context);
    final kecamatanProvider = Provider.of<KecamatanViewModel>(context);
    final kelurahanProvider = Provider.of<KelurahanViewModel>(context);
    final userProvider = Provider.of<UserViewModel>(context);
    GetHospitalByIDViewModel? sesiProvider =
        Provider.of<GetHospitalByIDViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Daftar Vaksin',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 10, 108, 157),
            ),
          ),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _index,
            onStepCancel: () {
              if (_index > 0) {
                setState(() {
                  _index -= 1;
                });
              } else if (_index == 0) {
                null;
              }
            },
            onStepContinue: () {
              final isLastStep = _index == 3;
              if (_index <= 2) {
                setState(() {
                  _index += 1;
                });
              } else if (isLastStep) {
                if (_formKey.currentState!.validate()) {
                  if (dropdownJenisKelamin != 'Jenis Kelamin Anda' &&
                      dropdownKategori != 'Pilih Kategori Anda' &&
                      dropdownKota != 'Pilih Kota' &&
                      dropdownVaskes != 'Pilih Faskes' &&
                      dropdownProvinsi != 'Pilih Provinsi' &&
                      dropdownKabupatenKota != 'Pilih Kabupaten' &&
                      dropdownKecamatan != 'Pilih Kecamatan' &&
                      dropdownKelurahan != 'Pilih Kelurahan' &&
                      dropdownProvinsiKtp != 'Pilih Provinsi Domisili' &&
                      dropdownKabupatenKotaKtp != 'Pilih Kabupaten Domisili' &&
                      dropdownKecamatanKtp != 'Pilih Kecamatan Domisili' &&
                      dropdownKelurahanKtp != 'Pilih Kelurahan Domisili' &&
                      sesiHospital != null &&
                      statusHamil != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TinjauBookingVaksinScreen(
                                  jalan: _jalanController.text,
                                  jalanKtp: _jalanKtpController.text,
                                  jenisKelamin: dropdownJenisKelamin,
                                  kabupaten: dropdownKabupatenKota,
                                  kabupatenKtp: dropdownKabupatenKotaKtp,
                                  kategori: dropdownKategori,
                                  kecamatan: dropdownKecamatan,
                                  kecamatanKtp: dropdownKecamatanKtp,
                                  kelurahan: dropdownKelurahan,
                                  kelurahanKtp: dropdownKelurahanKtp,
                                  nama: _namaController.text,
                                  nik: _nikController.text,
                                  phoneNumber: _nomorController.text,
                                  provinsi: dropdownProvinsi,
                                  provinsiKtp: dropdownProvinsiKtp,
                                  rt: _rtController.text,
                                  rtKtp: _rtKtpController.text,
                                  rw: _rwController.text,
                                  rwKtp: _rwKtpController.text,
                                  statusHamil: statusHamil!,
                                  tanggalLahir: _tanggalLahirController.text,
                                  tanggalVaksin:
                                      sesiHospital!.data!.scheduleDate!,
                                  tempatVaksin: dropdownVaskes,
                                  waktuVaksin:
                                      '${sesiHospital!.data!.scheduleTimeStart!}-${sesiHospital!.data!.scheduleTimeEnd!}',
                                  faskesId: sesiHospital!.data!.id!,
                                )));
                  }
                }
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            controlsBuilder: (context, details) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (_index != 0)
                    ElevatedButton(
                      onPressed: details.onStepCancel,
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          minimumSize:
                              MaterialStateProperty.all(const Size(160, 35)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: const Text(
                        'Sebelumnya',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                        minimumSize: _index == 0
                            ? MaterialStateProperty.all(const Size(330, 35))
                            : MaterialStateProperty.all(const Size(160, 35)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 10, 108, 157))),
                    child: const Text('Selanjutnya'),
                  ),
                ],
              );
            },
            steps: <Step>[
              Step(
                state: _index > 0 ? StepState.complete : StepState.indexed,
                isActive: _index >= 0,
                title: const Center(),
                content: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 27, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kategori',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          DropdownButton<String>(
                            hint: Text(dropdownKategori),
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black,
                            ),
                            dropdownColor: Colors.white,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownKategori = newValue!;
                              });
                            },
                            items: <String>['Remaja', 'Dewasa', 'Lansia']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 37,
                          ),
                          const Text(
                            'Apakah Anda Sedang Hamil ?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                        value: YesOrNo.ya,
                                        groupValue: _character,
                                        onChanged: (YesOrNo? value) {
                                          setState(() {
                                            _character = value;
                                            statusHamil = 'ya';
                                          });
                                        }),
                                    const Expanded(
                                      child: Text('Ya'),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                        value: YesOrNo.tidak,
                                        groupValue: _character,
                                        onChanged: (YesOrNo? value) {
                                          setState(() {
                                            _character = value;
                                            statusHamil = 'tidak';
                                          });
                                        }),
                                    const Expanded(child: Text('Tidak'))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Step(
                state: _index > 1 ? StepState.complete : StepState.indexed,
                isActive: _index >= 1,
                title: const Center(),
                content: Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Center(
                        child: Container(
                          height: 63,
                          width: 315,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 10, 108, 157),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 24, right: 24),
                              child: Text(
                                'Pastikan untuk kouta masih tersedia di faskes vaksinasi yang Anda Inginkan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Cari Kota Faskes',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: DropdownButton<String>(
                          hint: Text(dropdownKota),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownKota = newValue!;
                              int? cityId;
                              for (int i = 0;
                                  i < cityProvider.city.data!.length;
                                  i++) {
                                if (cityProvider.city.data![i].name ==
                                    dropdownKota) {
                                  cityId = cityProvider.city.data![i].id;
                                  break;
                                }
                              }
                              print(cityId);
                              hospitalProvider
                                  .getHospital(cityId!)
                                  .then((value) {
                                dropdownItemsFaskes;
                                setState(() {});
                              });
                            });
                          },
                          items: dropdownItemsCity,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Cari Lokasi Vaksinasi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: DropdownButton<String>(
                          hint: Text(dropdownVaskes),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownVaskes = newValue!;
                              for (int i = 0;
                                  i < hospitalProvider.hospital.data!.length;
                                  i++) {
                                if (hospitalProvider.hospital.data![i]
                                        .healthFacility!.name ==
                                    dropdownVaskes) {
                                  sesiProvider
                                      .getHospital(hospitalProvider
                                          .hospital.data![i].id!)
                                      .then((value) {
                                    print(sesiProvider.hospital.message);
                                    sesiHospital = sesiProvider.hospital;
                                  });

                                  break;
                                }
                              }
                            });
                          },
                          items: dropdownItemsFaskes,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Sesi waktu vaksin :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Lokasi',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sesiHospital == null
                                    ? const Center()
                                    : Text(
                                        sesiHospital!
                                            .data!.healthFacility!.name!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Jenis Vaksin',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sesiHospital == null
                                    ? const Center()
                                    : Text(
                                        sesiHospital!.data!.vaccine!.name!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tanggal Vaksin',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sesiHospital == null
                                    ? const Center()
                                    : Text(
                                        sesiHospital!.data!.scheduleDate!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Waktu Vaksin',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sesiHospital == null
                                    ? const Center()
                                    : Text(
                                        '${sesiHospital!.data!.scheduleTimeStart!}-${sesiHospital!.data!.scheduleTimeEnd!}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sisa Kuota',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sesiHospital == null
                                    ? const Center()
                                    : Text(
                                        (sesiHospital!.data!.quantity! -
                                                sesiHospital!.data!.booked!)
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                state: _index > 2 ? StepState.complete : StepState.indexed,
                isActive: _index >= 2,
                title: const Center(),
                content: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Nama Lengkap (Sesuai KTP)',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      //Form untuk nama
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: _namaController = TextEditingController(
                              text: userProvider.user.data!.name),
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Masukkan Nama Lengkap',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Masukkan Nama anda");
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Nomor Induk Kependudukan (NIK)',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      //Form untuk NIK
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: _nikController = TextEditingController(
                              text: userProvider.user.data!.nik),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{16}$)';
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty) {
                              return ("Masukkan NIK anda");
                            }
                            if (!regExp.hasMatch(value)) {
                              return ("Masukkan NIK yang valid");
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: DropdownButton<String>(
                          hint: Text(dropdownJenisKelamin =
                              userProvider.user.data!.name!),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownJenisKelamin = newValue!;
                            });
                          },
                          items: <String>['Laki-laki', 'Perempuan']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Tanggal Lahir',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: _tanggalLahirController =
                              TextEditingController(
                                  text: userProvider.user.data!.dateOfBirth),
                          decoration: const InputDecoration(
                            hintText: 'Tanggal Lahir',
                          ),
                          onTap: () async {
                            DateTime? date;
                            FocusScope.of(context).requestFocus(FocusNode());
                            date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            _tanggalLahirController.text =
                                DateFormat('yyyy-MM-dd').format(date!);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Masukkan Tanggal Lahir anda");
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'No. Handphone',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: _nomorController = TextEditingController(
                              text: userProvider.user.data!.phoneNumber),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: 'Nomor Telepon',
                          ),
                          validator: (value) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty) {
                              return ("Masukkan Nomor Telepon anda");
                            }
                            if (!regExp.hasMatch(value)) {
                              return ("Masukkan Nomor Telepon yang Valid");
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Container(
                          height: 92,
                          width: 315,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 10, 108, 157),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 24, right: 24),
                              child: Text(
                                'Usia 6-11 tahun bisa menggunakan no. HP orang tua/wali. Gunakan nomor aktif yang terhubung dengan WhatsApp agar dapat dihubungi petugas kesehatan.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                isActive: _index >= 3,
                title: const Center(),
                content: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 32, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ALAMAT (SESUAI KTP)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          'Jalan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          controller: _jalanController,
                          decoration: const InputDecoration(
                            hintText: 'Nama Jalan',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Masukkan Jalan Rumah Anda");
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Provinsi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DropdownButton<String>(
                          hint: Text(dropdownProvinsi),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownProvinsi = newValue!;
                              for (int i = 0;
                                  i < provinsiProvider.provinsi.length;
                                  i++) {
                                if (provinsiProvider.provinsi[i].name ==
                                    dropdownProvinsi) {
                                  kabupatenProvider.getKabupatenKota(int.parse(
                                      provinsiProvider.provinsi[i].id!));
                                  dropdownItemsKabupatenKota;
                                  break;
                                }
                              }
                            });
                          },
                          items: dropdownItemsProvinsi,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Kota/Kabupaten',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DropdownButton<String>(
                          hint: Text(dropdownKabupatenKota),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownKabupatenKota = newValue!;
                              for (int i = 0;
                                  i < kabupatenProvider.kabupatenKota.length;
                                  i++) {
                                if (kabupatenProvider.kabupatenKota[i].name ==
                                    dropdownKabupatenKota) {
                                  kecamatanProvider.getKecamatan(int.parse(
                                      kabupatenProvider.kabupatenKota[i].id!));
                                  dropdownItemsKecamatan;
                                  break;
                                }
                              }
                            });
                          },
                          items: dropdownItemsKabupatenKota,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Kecamatan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DropdownButton<String>(
                          hint: Text(dropdownKecamatan),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownKecamatan = newValue!;
                              for (int i = 0;
                                  i < kecamatanProvider.kecamatan.length;
                                  i++) {
                                if (kecamatanProvider.kecamatan[i].name ==
                                    dropdownKecamatan) {
                                  kelurahanProvider.getKelurahan(int.parse(
                                      kecamatanProvider.kecamatan[i].id!));
                                  dropdownItemsKelurahan;
                                  break;
                                }
                              }
                            });
                          },
                          items: dropdownItemsKecamatan,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Kelurahan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DropdownButton<String>(
                          hint: Text(dropdownKelurahan),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownKelurahan = newValue!;
                            });
                          },
                          items: dropdownItemsKelurahan,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'RT',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _rtController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Masukkan Nomor RT anda");
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'RW',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _rwController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Masukkan Nomor RW anda");
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          'ALAMAT DOMISILI',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Tempat tinggal di wilayah saat ini',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 10, 108, 157)),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                  if (isChecked) {
                                    _jalanKtpController.text =
                                        _jalanController.text;
                                    dropdownProvinsiKtp = dropdownProvinsi;
                                    dropdownKabupatenKotaKtp =
                                        dropdownKabupatenKota;
                                    dropdownKecamatanKtp = dropdownKecamatan;
                                    dropdownKelurahanKtp = dropdownKelurahan;
                                    _rtKtpController.text = _rtController.text;
                                    _rwKtpController.text = _rwController.text;
                                  }
                                });
                              },
                            ),
                            const Text(
                              'Sama dengan Alamat KTP',
                              style: TextStyle(
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
                        const Text(
                          'Jalan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          controller: _jalanKtpController,
                          decoration: const InputDecoration(
                            hintText: 'Nama Jalan Domisili',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Masukkan Jalan Rumah Anda Saat ini");
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Provinsi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DropdownButton<String>(
                          hint: Text(dropdownProvinsiKtp),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownProvinsiKtp = newValue!;
                              for (int i = 0;
                                  i < provinsiProvider.provinsi.length;
                                  i++) {
                                if (provinsiProvider.provinsi[i].name ==
                                    dropdownProvinsiKtp) {
                                  kabupatenProvider.getKabupatenKota(int.parse(
                                      provinsiProvider.provinsi[i].id!));
                                  dropdownItemsKabupatenKota;
                                  break;
                                }
                              }
                            });
                          },
                          items: dropdownItemsProvinsi,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Kota/Kabupaten',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DropdownButton<String>(
                          hint: Text(dropdownKabupatenKotaKtp),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownKabupatenKotaKtp = newValue!;
                              for (int i = 0;
                                  i < kabupatenProvider.kabupatenKota.length;
                                  i++) {
                                if (kabupatenProvider.kabupatenKota[i].name ==
                                    dropdownKabupatenKotaKtp) {
                                  kecamatanProvider.getKecamatan(int.parse(
                                      kabupatenProvider.kabupatenKota[i].id!));
                                  dropdownItemsKecamatan;
                                  break;
                                }
                              }
                            });
                          },
                          items: dropdownItemsKabupatenKota,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Kecamatan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DropdownButton<String>(
                          hint: Text(dropdownKecamatanKtp),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownKecamatanKtp = newValue!;
                              for (int i = 0;
                                  i < kecamatanProvider.kecamatan.length;
                                  i++) {
                                if (kecamatanProvider.kecamatan[i].name ==
                                    dropdownKecamatanKtp) {
                                  kelurahanProvider.getKelurahan(int.parse(
                                      kecamatanProvider.kecamatan[i].id!));
                                  dropdownItemsKelurahan;
                                  break;
                                }
                              }
                            });
                          },
                          items: dropdownItemsKecamatan,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Kelurahan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DropdownButton<String>(
                          hint: Text(dropdownKelurahanKtp),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownColor: Colors.white,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownKelurahanKtp = newValue!;
                            });
                          },
                          items: dropdownItemsKelurahan,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'RT',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _rtKtpController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Masukkan Nomor RT anda");
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'RW',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _rwKtpController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Masukkan Nomor RW anda");
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
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
