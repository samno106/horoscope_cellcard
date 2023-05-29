import 'package:audioplayers/audioplayers.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/layouts/base_navbar.dart';

import '../../constants/carousel_property.dart';
import '../../constants/colors.dart';
import '../../constants/language.dart';

import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/path_painter.dart';

class DailyHoroscopePage extends StatefulWidget {
  const DailyHoroscopePage({Key? key}) : super(key: key);

  @override
  State<DailyHoroscopePage> createState() => _DailyHoroscopePageState();
}

class _DailyHoroscopePageState extends State<DailyHoroscopePage> {
  int selectedYearName = 0;

  AudioPlayer audioPlayer = AudioPlayer();
  late Source audioUrl;
  Duration duration = const Duration();
  Duration position = const Duration();

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            height: 190.0,
            child: Stack(
              children: <Widget>[
                ClipPath(
                    clipper: CurvedBottomClipper(),
                    child: Container(
                      color: primaryColor,
                      height: 160.0,
                      width: MediaQuery.of(context).size.width,
                      child: null,
                    )),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: BaseNavbar(
                    title: languages[26].kh,
                  ),
                ),
                Positioned(
                  top: 70.0,
                  left: 0,
                  right: 0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          listYearName[selectedYearName],
                          style: GoogleFonts.notoSansKhmer(
                              textStyle: TextStyle(
                            fontSize: 18,
                            color: textDarkColor,
                            fontWeight: FontWeight.bold,
                          )),
                        )
                      ]),
                ),
                Positioned(
                    top: 130.0,
                    left: 0,
                    right: 0,
                    child: CurvedCarousel(
                      itemBuilder: (_, selectedYearName) {
                        return SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Image(
                              image:
                                  AssetImage(carouselList[selectedYearName])),
                        );
                      },
                      itemCount: 12,
                      middleItemScaleRatio: 2,
                      disableInfiniteScrolling: false,
                      curveScale: 10,
                      onChangeEnd: ((index, automatic) {
                        setState(() {
                          selectedYearName = index;
                        });
                      }),
                    )),
                Positioned(
                  top: 70.0,
                  child: CustomPaint(
                    painter: PathPainter(drawPath()),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0.0),
            height: 55,
            child: Stack(children: [
              Positioned(
                top: 30,
                left: MediaQuery.of(context).size.width / 2.1,
                child: const SizedBox(
                  height: 17.0,
                  width: 21.0,
                  child: Image(image: AssetImage('/images/vector/vector.png')),
                ),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    languages[12].kh,
                    style: GoogleFonts.notoSansKhmer(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  const Image(image: AssetImage('/images/vector/line1.png'))
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: getAudio,
                  child: playing == false
                      ? Icon(FeatherIcons.play, color: blueColor)
                      : Icon(FeatherIcons.pause, color: primaryColor),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Slider(
                    min: 0.0,
                    thumbColor: primaryColor,
                    activeColor: primaryColor,
                    inactiveColor: const Color.fromARGB(255, 255, 225, 169),
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    onChanged: (double value) => {
                      setState(() =>
                          audioPlayer.seek(Duration(seconds: value.toInt())))
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
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ))),
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
