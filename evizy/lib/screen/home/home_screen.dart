import 'package:carousel_slider/carousel_slider.dart';
import 'package:evizy/screen/profile/profile_screen.dart';
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
    Color.fromARGB(255, 250, 199, 104),
    Color.fromARGB(255, 228, 109, 100),
    Color.fromARGB(255, 40, 171, 108)
  ];

  int carouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 245, 251),
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
                      builder: (context) => const ProfileScreen()));
            },
            icon: Icon(
              Icons.person_rounded,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
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
                const SizedBox(
                  height: 120,
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
                          decoration: BoxDecoration(
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
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
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
                                              Color.fromARGB(
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
                                          children: [
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  'Layanan Tersedia',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Expanded(
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 0,
                                            mainAxisSpacing: 10),
                                    itemCount: testData.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            height: 64,
                                            width: 64,
                                            decoration: BoxDecoration(
                                              color: gridColor[index],
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 32,
                                            width: 72,
                                            child: Text(
                                              testData[index],
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        height: 171,
                        width: 349,
                        decoration: BoxDecoration(
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
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(17)),
                                      color: testColor[index],
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
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
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
                            )
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
