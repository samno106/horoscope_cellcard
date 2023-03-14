import 'package:audioplayers/audioplayers.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/carousel_property.dart';
import '../../constants/colors.dart';
import '../../constants/horoscope_property.dart';
import '../../constants/language.dart';
import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/path_painter.dart';

class CoupleHoroscopePage extends StatefulWidget {
  CoupleHoroscopePage({Key? key}) : super(key: key);

  @override
  State<CoupleHoroscopePage> createState() => _CoupleHoroscopePageState();
}

class _CoupleHoroscopePageState extends State<CoupleHoroscopePage> {
  int selectedYearName = 0;

  AudioPlayer audioPlayer = new AudioPlayer();
  late Source audioUrl;
  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;

  bool isResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          languages[32].kh,
          style: GoogleFonts.notoSerifKhmer(
              textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: textDarkColor)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            FeatherIcons.chevronLeft,
            size: 30.0,
            color: canvasColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
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
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 196.0,
                        width: 240.0,
                        child: Image(
                            image:
                                AssetImage('/images/vector/couple_vector.png')),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 35.0,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languages[28].kh,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.notoSerifKhmer(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: textDarkColor)),
                      ),
                    ]),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 35.0,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40.0,
                            child: Text(
                              languages[33].kh,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.notoSerifKhmer(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: textDarkColor)),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 40.0,
                            child: TextField(
                              style: TextStyle(
                                fontSize: 14.0,
                                color: canvasColor,
                              ),
                              onTap: () {},
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText:
                                    '${languages[35].kh} / ${languages[36].kh} / ${languages[37].kh}',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: borderColor, width: 1.0),
                                    borderRadius: BorderRadius.circular(6.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40.0,
                            child: Text(
                              languages[34].kh,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.notoSerifKhmer(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: textDarkColor)),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 40.0,
                            child: TextField(
                              style: TextStyle(
                                fontSize: 14.0,
                                color: canvasColor,
                              ),
                              onTap: () {},
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText:
                                    '${languages[35].kh} / ${languages[36].kh} / ${languages[37].kh}',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: borderColor, width: 1.0),
                                    borderRadius: BorderRadius.circular(6.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                            ),
                          ))
                        ],
                      )
                    ]),
              ),
              SizedBox(
                child: Visibility(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
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
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          '/images/vector_year/dragon.png'),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      listYearName[4],
                                      style: GoogleFonts.notoSerifKhmer(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Image(
                                    fit: BoxFit.contain,
                                    width: 39.0,
                                    height: 24.5,
                                    image:
                                        AssetImage('/images/vector/heart.png')),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          '/images/vector_year/pig.png'),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      listYearName[11],
                                      style: GoogleFonts.notoSerifKhmer(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
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
                          SizedBox(
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
                                  child: Slider(
                                    min: 0.0,
                                    thumbColor: primaryColor,
                                    activeColor: primaryColor,
                                    inactiveColor:
                                        Color.fromARGB(255, 255, 225, 169),
                                    value: position.inSeconds.toDouble(),
                                    max: duration.inSeconds.toDouble(),
                                    onChanged: (double value) => {
                                      setState(() => {
                                            audioPlayer.seek(new Duration(
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
                  maintainSize: isResult,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: isResult,
                ),
              ),
              SizedBox(
                height: !isResult
                    ? MediaQuery.of(context).size.height / (210 / 100)
                    : 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: textGreyColor,
                        primary: primaryColor,
                        onPrimary: Colors.white,
                        shadowColor: blueColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        minimumSize: Size(double.infinity, 45),
                      ),
                      onPressed: () {
                        setState(() {
                          isResult = !isResult;
                        });
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    maintainSize: !isResult,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: !isResult,
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
    // audioUrl = UrlSource(
    //     'http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3');

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
