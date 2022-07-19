import 'package:evizy/screen/splash/splash_screen.dart';
import 'package:evizy/utils/constant/preferences_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 142),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Group33670.png'),
                          fit: BoxFit.contain,
                        ),
                        color: Color.fromARGB(255, 10, 108, 157),
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    const Text(
                      'Selamat Datang Di Evizy',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 10, 108, 157),
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Container(
                      width: 322,
                      child: const Text(
                        'Lakukan Pendaftaran Vaksin Secara Online, Dan Sesuaikan Jadwal Yang Anda Inginkan.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 10, 108, 157),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Group33672.png'),
                          fit: BoxFit.contain,
                        ),
                        color: Color.fromARGB(255, 10, 108, 157),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 217,
                      child: const Text(
                        'Daftarkan Keluarga Anda',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 10, 108, 157),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Container(
                      width: 239,
                      child: const Text(
                        'Anda Juga Dapat Mendaftarkan keluarga Anda',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 10, 108, 157),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Group33680.png'),
                          fit: BoxFit.contain,
                        ),
                        color: Color.fromARGB(255, 10, 108, 157),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 189,
                      child: const Text(
                        'Unduh Tiket Vaksin Anda',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 10, 108, 157),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Container(
                      width: 154,
                      child: const Text(
                        'Tiket Bisa Diakses Kapanpun Anda Mau',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 10, 108, 157),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 142,
        child: Center(
          child: Column(
            children: [
              isLastPage
                  ? ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool(PreferencesKeys.onBoarding, true);
                        Navigator.pushAndRemoveUntil(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => const SplashScreen()),
                            (route) => false);
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          minimumSize:
                              MaterialStateProperty.all(const Size(172, 50)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 10, 108, 157))),
                      child: const Text(
                        'Memulai',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          minimumSize:
                              MaterialStateProperty.all(const Size(172, 50)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 10, 108, 157))),
                      child: const Text(
                        'Lanjut',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 40,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  spacing: 7,
                  dotColor: Colors.grey,
                  activeDotColor: Color.fromARGB(255, 10, 108, 157),
                ),
                onDotClicked: (index) {
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
