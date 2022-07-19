import 'package:evizy/model/expansion_panel/expansion_panel_model.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<ExpansionPanelModel> _data = [
    ExpansionPanelModel(
        expandedValue:
            '1. Sebelum menggunakan masker, pastikan sudah mencuci tangan dengan sabun selama 20 detik atau bisa gunakan hand sanitizer.\n2.  gunakan masker sampai menutupi hidung, mulut dan dagu anda. pastikan tidak ada cela antara masker dan wajah.\n3.  pastikan untuk mengganti masker ketika masker basah. masker medis hanya bisa digunakan sekali, sedangkan masker kain bisa digunakan berkali kali tetapi butuh untuk dicuci',
        headerValue: 'Menggunakan Masker Dengan Tepat',
        isExpanded: true),
    ExpansionPanelModel(
        expandedValue:
            '1. Cuci Tangan, lakukan setiap sebelum dan sesudah melakukan aktivitas.\n2. Pakai Masker,Saat pandemi mulai melanda dunia, Organisasi Kesehatan Dunia (WHO) menyebutkan bahwa penggunaan masker hanya dilakukan untuk orang-orang yang terserang penyakit, bukan orang yang sehat.\n3. Menjaga Jarak, Protokol kesehatan 5 M selanjutnya adalah menjaga jarak saat sedang beraktivitas di luar ruangan.\n4. Menjauhi Kerumunan, Selain tiga hal di atas, menjauhi kerumunan juga merupakan protokol kesehatan yang harus dilakukan.\n5. Mengurangi Mobilitas, Virus penyebab corona bisa berada di mana saja. Jadi, semakin banyak waktu yang kamu habiskan di luar rumah, maka semakin tinggi pula risiko tubuh terpapar virus jahat ini.',
        headerValue: 'Protokol Kesehatan'),
    ExpansionPanelModel(
        expandedValue:
            '1. Hindari penggunaan transportasi publik sebisa mungkin\n2. Hindari kunjungan ke rumah teman/kerabat, terutama kelompok usia tua\n3. Kurangi pergi keluar rumah\n4. Jaga jarak 2 eter dari orang lain jika di tempat umum\n5. Tidak pergi liburan keluar kota/negeri',
        headerValue: 'Bagaimana aturan jaga jarak ?'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'FAQ',
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [_buildPanel()],
              ),
            ),
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
            .map<ExpansionPanel>((ExpansionPanelModel expansionPanelModel) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(expansionPanelModel.headerValue),
              );
            },
            body: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
              child: Text(
                expansionPanelModel.expandedValue,
                style:
                    const TextStyle(color: Color.fromARGB(255, 190, 190, 190)),
              ),
            ),
            isExpanded: expansionPanelModel.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
