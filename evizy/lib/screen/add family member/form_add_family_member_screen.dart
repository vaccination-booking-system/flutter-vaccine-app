import 'package:evizy/screen/add%20family%20member/add_family_member_screen.dart';
import 'package:evizy/view_model/add_family_member_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormAddFamilyMember extends StatefulWidget {
  const FormAddFamilyMember({Key? key}) : super(key: key);

  @override
  State<FormAddFamilyMember> createState() => _FormAddFamilyMemberState();
}

class _FormAddFamilyMemberState extends State<FormAddFamilyMember> {
  //Global Key untuk Form
  final _formKey = GlobalKey<FormState>();

  //Controller buat Form
  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _nomorController = TextEditingController();

  //Buat Form Controller
  @override
  void dispose() {
    super.dispose();
    _namaController.dispose();
    _nikController.dispose();
    _nomorController.dispose();
    _tanggalController.dispose();
  }

  String dropdownJenisKelamin = 'Jenis Kelamin Anda';
  String dropdownHubungan = 'Pilih Hubungan';

  @override
  Widget build(BuildContext context) {
    final addFamilyMemberProvider =
        Provider.of<AddFamilyMemberViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Add Family Member',
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Nama Lengkap (Sesuai KTP)',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                //Form untuk nama
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    controller: _namaController,
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                //Form untuk NIK
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    controller: _nikController,
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Center(
                  child: DropdownButton<String>(
                    hint: Text(dropdownJenisKelamin),
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    controller: _tanggalController,
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
                      _tanggalController.text =
                          DateFormat('yyyy-MM-dd').format(date!);
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Hubungan',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Center(
                  child: DropdownButton<String>(
                    hint: Text(dropdownHubungan),
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
                        dropdownHubungan = newValue!;
                      });
                    },
                    items: <String>[
                      'Ayah',
                      'Ibu',
                      'Anak',
                      'Saudara',
                    ].map<DropdownMenuItem<String>>((String value) {
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
                    'Nomor Telepon',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    controller: _nomorController,
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
                  height: 142,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side:
                                        const BorderSide(color: Colors.black))),
                            minimumSize:
                                MaterialStateProperty.all(const Size(168, 39)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: const Text(
                          'Sebelumnya',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        )),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            dropdownHubungan != 'Pilih Hubungan' &&
                            dropdownJenisKelamin != 'Jenis Kelamin Anda') {
                          final bool isAvailable =
                              await addFamilyMemberProvider.createFamilyMember(
                            _namaController.text,
                            _nikController.text,
                            _nomorController.text,
                            _tanggalController.text,
                            dropdownJenisKelamin,
                            dropdownHubungan,
                          );
                          if (isAvailable) {
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
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
                                        Text('Berhasil Di Tambahkan'),
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
                                          'Penambahan Anggota',
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
                                          Navigator.pushReplacement<void, void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  const AddFamilyMemberScreen(),
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            )),
                                            minimumSize:
                                                MaterialStateProperty.all(
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          minimumSize:
                              MaterialStateProperty.all(const Size(168, 39)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 10, 108, 157))),
                      child: const Text('Tambahkan'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
