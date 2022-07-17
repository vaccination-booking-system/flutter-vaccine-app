import 'package:evizy/model/expansion_panel/expansion_panel_model.dart';
import 'package:flutter/material.dart';

class TentangKamiScreen extends StatefulWidget {
  const TentangKamiScreen({Key? key}) : super(key: key);

  @override
  State<TentangKamiScreen> createState() => _TentangKamiScreenState();
}

class _TentangKamiScreenState extends State<TentangKamiScreen> {
  final List<ExpansionPanelModel> _data = [
    ExpansionPanelModel(
        expandedValue:
            'YukVaksin merupakan aplikasi yang digunakan  untuk melakukan track and trace dari penyebaran virus Covid-19 serta membantu masyarakat mendaftar vaksin.\n\nYukVaksin dapat melindungi diri anda, kerabat maupun keluarga. anda bisa mengakses info statistik perkembangan corona serta informasi lain terkait wabah coronavirus yangsedang terjadi saat ini.',
        headerValue: 'Deskripsi Aplikasi',
        isExpanded: true),
    ExpansionPanelModel(
        expandedValue: 'No Content', headerValue: 'Cara Kerja Aplikasi'),
    ExpansionPanelModel(
        expandedValue: 'No Content', headerValue: 'Kontak Kami'),
    ExpansionPanelModel(
        expandedValue: 'No Content', headerValue: 'Versi Aplikasi'),
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
          'Tentang Kami',
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
              height: MediaQuery.of(context).size.height / 1.213,
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
                style:
                    const TextStyle(color: Color.fromARGB(255, 190, 190, 190)),
              ),
            ),
            isExpanded: ExpansionPanelModel.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
