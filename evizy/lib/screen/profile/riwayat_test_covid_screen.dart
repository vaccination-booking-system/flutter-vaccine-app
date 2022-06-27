import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RiwayatTestCovidScreen extends StatefulWidget {
  const RiwayatTestCovidScreen({Key? key}) : super(key: key);

  @override
  State<RiwayatTestCovidScreen> createState() => _RiwayatTestCovidScreenState();
}

class _RiwayatTestCovidScreenState extends State<RiwayatTestCovidScreen> {
  String dropdownValue = 'Sebulan Terakhir';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.26,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                      color: Color.fromARGB(255, 10, 108, 157),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        ),
                        dropdownColor: Color.fromARGB(255, 10, 108, 157),
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'Sebulan Terakhir',
                          'Seminggu Terakhir',
                          'Setahun Terakhir'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
}
