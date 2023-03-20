import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/carousel_property.dart';
import '../../constants/colors.dart';
import '../../constants/language.dart';
import '../../layouts/base_navbar.dart';
import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/path_painter.dart';

class BankNumberHoroscopePage extends StatefulWidget {
  const BankNumberHoroscopePage({super.key});

  @override
  State<BankNumberHoroscopePage> createState() =>
      _BankNumberHoroscopePageState();
}

class _BankNumberHoroscopePageState extends State<BankNumberHoroscopePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  late Source audioUrl;
  Duration duration = const Duration();
  Duration position = const Duration();

  bool playing = false;

  bool isResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              BaseNavbar(
                title: languages[43].kh,
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                height: 215.0,
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                        clipper: CurvedBottomClipper(),
                        child: Container(
                          color: primaryColor,
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          child: null,
                        )),
                    Positioned(
                      top: 15,
                      child: CustomPaint(
                        painter: PathPainter(drawPath()),
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 111.0,
                        width: 111.0,
                        child: Image(
                            image:
                                AssetImage('/images/vector/bank_vector.png')),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 5.1,
                      left: MediaQuery.of(context).size.width / 2.1,
                      child: const SizedBox(
                        height: 17.0,
                        width: 21.0,
                        child: Image(
                            image: AssetImage('/images/vector/vector.png')),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                languages[44].kh,
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerifKhmer(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textDarkColor)),
              ),
              SizedBox(
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 40.0,
                    child: TextField(
                      onSubmitted: (String value) {
                        setState(() {
                          isResult = true;
                        });
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: canvasColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2.0),
                        hintText: languages[41].kh,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: blueColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Visibility(
                  maintainSize: isResult,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: isResult,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 35.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            languages[38].kh,
                            style: GoogleFonts.notoSerifKhmer(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            content2,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: textDarkColor,
                              height: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: getAudio,
                                  child: playing == false
                                      ? Icon(FeatherIcons.play,
                                          color: blueColor)
                                      : Icon(FeatherIcons.pause,
                                          color: primaryColor),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Slider(
                                    min: 0.0,
                                    thumbColor: primaryColor,
                                    activeColor: primaryColor,
                                    inactiveColor: const Color.fromARGB(
                                        255, 255, 225, 169),
                                    value: position.inSeconds.toDouble(),
                                    max: duration.inSeconds.toDouble(),
                                    onChanged: (double value) => {
                                      setState(() => {
                                            audioPlayer.seek(Duration(
                                                seconds: value.toInt()))
                                          })
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: getAudio,
                                  child: Icon(
                                    FeatherIcons.share2,
                                    color: blueColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getAudio() async {
    audioUrl = UrlSource("http://localhost:51613/assets/sounds/audio1.mp3");

    if (playing) {
      await audioPlayer.pause();
      setState(() {
        playing = false;
      });
    } else {
      // await audioPlayer.play(audioUrl);

      await audioPlayer.play(audioUrl);

      setState(() {
        playing = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }

  Path drawPath() {
    Size size = Size(MediaQuery.of(context).size.width, 200);
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    return path;
  }
}
