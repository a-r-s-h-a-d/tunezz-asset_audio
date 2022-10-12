import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_home.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoScreenHome();
    //requestPermission();
    super.initState();
  }

  // void requestPermission() {
  //   _audioquery.Permission.storage.request();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: TextLiquidFill(
          text: 'tunezz',
          waveColor: const Color.fromARGB(227, 18, 179, 219),
          boxBackgroundColor: Colors.black,
          textStyle: TextStyle(
            fontSize: width * 0.23,
            fontFamily: "Alegreya Sans",
          ),
        ),
      ),
    );
  }

  Future<void> gotoScreenHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ScreenHome()));
  }
}
