import 'package:carousel_slider/carousel_slider.dart';
import 'package:evizy/screen/add%20family%20member/family_member_screen.dart';
import 'package:evizy/screen/booking%20vaccine/booking_vaccine_screen.dart';
import 'package:evizy/screen/profile/dashboard_screen.dart';
import 'package:evizy/screen/tiket%20vaksin/tiket_vaksin_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List testData = ['Booking Vaksin', 'Add Family Member', 'Tiket Vaksin'];
  List<Color> testColor = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green
  ];

  List<Color> gridColor = [
    const Color.fromARGB(255, 250, 199, 104),
    const Color.fromARGB(255, 228, 109, 100),
    const Color.fromARGB(255, 40, 171, 108)
  ];

  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 251),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Alterra Academy',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()));
            },
            icon: const Icon(
              Icons.person_rounded,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 16,
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Tentang Anda',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 12, 15, 12),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      )),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(345, 70)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 5, 105, 151))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  'PCR Antigen',
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.white),
                                                ),
                                                const VerticalDivider(),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      36,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      8,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 123, 203, 156),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: const Center(
                                                      child: Text(
                                                    'Negatif',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )),
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              'Berlaku Hingga 25 Desember 2021  (16:00)',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 4),
                                        child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 12, 15, 12),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      )),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(345, 70)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 237, 245, 251))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Sertifikat',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Cek Sertifikat Vaksin',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 4),
                                        child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Layanan Tersedia',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Expanded(
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 10,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BookingVaccine()));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 64,
                                            width: 64,
                                            decoration: BoxDecoration(
                                              color: gridColor[0],
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/TheLifesaversVaccine.png'),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          SizedBox(
                                            height: 32,
                                            width: 72,
                                            child: Text(
                                              testData[0],
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FamilyMemberScreen()));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 64,
                                            width: 64,
                                            decoration: BoxDecoration(
                                              color: gridColor[1],
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/+image.png'),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          SizedBox(
                                            height: 32,
                                            width: 72,
                                            child: Text(
                                              testData[1],
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TiketVaksinScreen()));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 64,
                                            width: 64,
                                            decoration: BoxDecoration(
                                              color: gridColor[2],
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/CoronaVirus.png'),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          SizedBox(
                                            height: 32,
                                            width: 72,
                                            child: Text(
                                              testData[2],
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        height: 171,
                        width: 349,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(17)),
                            color: Color.fromRGBO(236, 236, 236, 1),
                            boxShadow: [
                              BoxShadow(spreadRadius: 5, color: Colors.white)
                            ]),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            CarouselSlider.builder(
                                itemCount: testColor.length,
                                itemBuilder: (BuildContext context, int index,
                                    int pageViewIndex) {
                                  return Container(
                                    height: 171,
                                    width: 349,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(17)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/landing.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Color.fromARGB(255, 5, 105, 151),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  height: 171,
                                  // aspectRatio: 16 / 9,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 10),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, _) {
                                    carouselIndex = index;
                                    setState(() {});
                                  },
                                  scrollDirection: Axis.horizontal,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: SizedBox(
                                height: 6,
                                child: ListView.builder(
                                  itemExtent: 8,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: carouselIndex == index
                                            ? Colors.white
                                            : Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  },
                                  itemCount: testColor.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
