import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailTiketVaksin extends StatelessWidget {
  const DetailTiketVaksin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: IconThemeData(
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
              SizedBox(
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
              SizedBox(
                height: 32,
              ),
              _rowMaker('Nomor Tiket :', 'LPA-2156995'),
              SizedBox(
                height: 16,
              ),
              _rowMaker('Lokasi :', 'RPTRA TANAH ABANG III-SINOVAC'),
              SizedBox(
                height: 16,
              ),
              _rowMaker('Tanggal Tes :', '27 MEI 2022'),
              SizedBox(
                height: 16,
              ),
              _rowMaker('Jam Tes :', '08:00 - 10.30'),
              SizedBox(
                height: 32,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Identitas Pasien',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              _rowMaker('NIK :', '2234567890123456'),
              SizedBox(
                height: 16,
              ),
              _rowMaker('Nama Pasien :', 'Nathan'),
              SizedBox(
                height: 16,
              ),
              _rowMaker('Tangga Lahir :', '14 April 1996'),
              SizedBox(
                height: 16,
              ),
              _rowMaker('Jenis Kelamin :', 'Laki-laki'),
              SizedBox(
                height: 16,
              ),
              _rowMaker('Alamat :', 'Jl. Soekarno Hatta J21'),
              SizedBox(
                height: 68.5,
              ),
              Center(
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'Lihat QR Code',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 60.5,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 345,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color.fromARGB(255, 10, 108, 157),
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
                            Color.fromARGB(255, 10, 108, 157))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            dataKanan,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
