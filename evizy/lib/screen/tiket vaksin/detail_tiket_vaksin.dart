import 'package:flutter/material.dart';

class DetailTiketVaksin extends StatelessWidget {
  final int nomorTiket;
  final String lokasi;
  final String tanggalTest;
  final String jamTest;
  final String nik;
  final String nama;
  final String tanggalLahir;
  final String jenisKelamin;
  final String alamat;
  const DetailTiketVaksin(
      {Key? key,
      required this.nomorTiket,
      required this.lokasi,
      required this.tanggalTest,
      required this.jamTest,
      required this.nik,
      required this.nama,
      required this.tanggalLahir,
      required this.jenisKelamin,
      required this.alamat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Nathan',
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text(
                  'Vaksin Pertama',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              _rowMaker('Id Tiket Vaksin :', nomorTiket.toString()),
              const SizedBox(
                height: 16,
              ),
              _rowMaker('Lokasi :', lokasi),
              const SizedBox(
                height: 16,
              ),
              _rowMaker('Tanggal Tes :', tanggalTest),
              const SizedBox(
                height: 16,
              ),
              _rowMaker('Jam Tes :', jamTest),
              const SizedBox(
                height: 32,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Identitas Pasien',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _rowMaker('NIK :', nik),
              const SizedBox(
                height: 16,
              ),
              _rowMaker('Nama Pasien :', nama),
              const SizedBox(
                height: 16,
              ),
              _rowMaker('Tangga Lahir :', tanggalLahir),
              const SizedBox(
                height: 16,
              ),
              _rowMaker('Jenis Kelamin :', jenisKelamin),
              const SizedBox(
                height: 16,
              ),
              _rowMaker('Alamat :', alamat),
              const SizedBox(
                height: 68.5,
              ),
              Center(
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text(
                  'Lihat QR Code',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 60.5,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 345,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color.fromARGB(255, 10, 108, 157),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                        minimumSize:
                            MaterialStateProperty.all(const Size(345, 40)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 10, 108, 157))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Unduh File PDF  ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.cloud_download_outlined)
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

  Widget _rowMaker(String dataKiri, String dataKanan) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dataKiri,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            dataKanan,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
