import 'package:evizy/model/expansion_panel/expansion_panel_model.dart';
import 'package:evizy/screen/booking%20vaccine/langkah_booking_vaksin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SyaratDanKetentuan extends StatefulWidget {
  const SyaratDanKetentuan({Key? key}) : super(key: key);

  @override
  State<SyaratDanKetentuan> createState() => _SyaratDanKetentuanState();
}

class _SyaratDanKetentuanState extends State<SyaratDanKetentuan> {
  final List<ExpansionPanelModel> _data = [
    ExpansionPanelModel(
      expandedValue:
          'Memiliki Kartu Keluarga (KK) atau KIA (Kartu identitas Anak).',
      headerValue: 'Anak Usia 6-18 Tahun',
    ),
    ExpansionPanelModel(
      expandedValue: 'Memiliki Kartu Tanda Penduduk (KTP).',
      headerValue: 'Usia 17 Tahun ke Atas',
    ),
    ExpansionPanelModel(
      expandedValue:
          'Penyintas atau seseorang yang pernah mengalami positif COVID-19 kini bisa disuntikkan vaksin setelah 1 bulan dinyatakan sembuh dan hasil swab negatif.',
      headerValue: 'Penyintas COVID-19',
    ),
    ExpansionPanelModel(
      expandedValue:
          'menunjukkan identitas diri yang valid untuk kebutuhan pendataan dan sertifikat vaksinasi Covid-19.',
      headerValue: 'Warga Negara Asing (WNA)',
    ),
    ExpansionPanelModel(
      expandedValue:
          'Telah mendapatkan vaksinasi primer dosis lengkap minimal enam bulan sebelumnya.',
      headerValue: 'Vaksin Dosis 3/Booster',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: IconThemeData(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 26,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 54,
                          ),
                          _buildPanel(),
                          SizedBox(
                            height: 27,
                          ),
                          Container(
                            height: 130,
                            width: 345,
                            decoration: BoxDecoration(
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
                                      'Petugas vaksinasi dapat memutuskan untuk tidak memberikan vaksinasi jika tidak sesuai dengan syarat dan ketentuan yang berlaku.',
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
                          SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LangkahBookingVaksin()));
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
                                    Color.fromARGB(255, 10, 108, 157))),
                            child: const Text('Saya Mengerti'),
                          ),
                          SizedBox(
                            height: 60.5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 43,
                    width: 255,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                      color: Color.fromARGB(255, 10, 108, 157),
                    ),
                    child: const Center(
                      child: Text(
                        'Syarat dan Ketentuan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data
            .map<ExpansionPanel>((ExpansionPanelModel ExpansionPanelModel) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(ExpansionPanelModel.headerValue),
              );
            },
            body: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
              child: Text(
                ExpansionPanelModel.expandedValue,
                style: TextStyle(color: Color.fromARGB(255, 190, 190, 190)),
              ),
            ),
            isExpanded: ExpansionPanelModel.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
