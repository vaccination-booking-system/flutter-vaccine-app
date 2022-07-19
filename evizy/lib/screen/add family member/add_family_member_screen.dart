import 'package:evizy/screen/add%20family%20member/family_member_screen.dart';
import 'package:evizy/screen/add%20family%20member/form_add_family_member_screen.dart';
import 'package:evizy/screen/add%20family%20member/update_family_member_screen.dart';
import 'package:evizy/screen/profile/profile_screen.dart';
import 'package:evizy/view_model/delete_family_member_view_model.dart';
import 'package:evizy/view_model/get_family_member_view_model.dart';
import 'package:evizy/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  const AddFamilyMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddFamilyMemberScreen> createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    final familyProvider = Provider.of<GetFamilyMemberViewModel>(context);
    final deleteFamilyProvider =
        Provider.of<DeleteFamilyMemberViewModel>(context);
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 320,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Components7.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.475,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileScreen()));
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(345, 91)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 5, 105, 151))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Profil Anda',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      userProvider.user.data!.name!,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      'Akun Anda',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(Icons.keyboard_arrow_right_rounded,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 31),
                        child: Text(
                          'Profil Anggota',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      familyProvider.familyMember.data!.isEmpty
                          ? const Center()
                          : Flexible(
                              child: _listFamilyMaker(
                                  familyProvider, deleteFamilyProvider)),
                      const SizedBox(
                        height: 29,
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const FormAddFamilyMember(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(175, 49)),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 5, 105, 151))),
                            child: const Text(
                              '+ Tambah Anggota',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listFamilyMaker(GetFamilyMemberViewModel viewModel,
      DeleteFamilyMemberViewModel deleteFamilyMemberViewModel) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final name = viewModel.familyMember.data![index].name!;
        return Center(
          child: Container(
            height: 60,
            width: 335,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        final family = viewModel.familyMember.data![index];
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                UpdateFamilyMemberScreen(
                              id: family.id,
                              nik: family.nik,
                              name: family.name,
                              phoneNumber: family.phoneNumber,
                              dateOfBirth: family.dateOfBirth,
                              gender: family.gender,
                              relationship: family.relationship,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.update_rounded),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Apakah kamu yakin?'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text(
                                        'Familiy member tidak bisa dikembalikan setelah di delete'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ya'),
                                  onPressed: () {
                                    final family =
                                        viewModel.familyMember.data![index];
                                    deleteFamilyMemberViewModel
                                        .deleteFamilyMember(family.id!);
                                    Navigator.pushReplacement<void, void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const FamilyMemberScreen(),
                                      ),
                                    );
                                  },
                                ),
                                TextButton(
                                  child: const Text('Tidak'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.delete_rounded),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.transparent,
        height: 15,
      ),
      itemCount: viewModel.familyMember.data!.length,
    );
  }
}
