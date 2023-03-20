import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constants/carousel_property.dart';
import '../../constants/colors.dart';

import '../../constants/language.dart';
import '../../layouts/base_navbar.dart';
import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/path_painter.dart';

class CoupleHoroscopePage extends StatefulWidget {
  const CoupleHoroscopePage({Key? key}) : super(key: key);

  @override
  State<CoupleHoroscopePage> createState() => _CoupleHoroscopePageState();
}

class _CoupleHoroscopePageState extends State<CoupleHoroscopePage> {
  int selectedYearName = 0;

  AudioPlayer audioPlayer = AudioPlayer();
  late Source audioUrl;
  Duration duration = const Duration();
  Duration position = const Duration();

  bool playing = false;

  bool isResult = false;

  final TextEditingController _textBoyEditingController =
      TextEditingController();
  final TextEditingController _textGirlEditingController =
      TextEditingController();
  DateTime selectedBoyDate = DateTime.now();
  DateTime selectedGirlDate = DateTime.now();
  final startDate = DateTime(1969, 1);
  final lasttDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              BaseNavbar(
                title: languages[32].kh,
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
                          const SizedBox(
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
                              controller: _textBoyEditingController,
                              onTap: () => _openBoyDatepicker(context),
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
                      const SizedBox(
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
                          const SizedBox(
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
                              controller: _textGirlEditingController,
                              onTap: () => _openGirlDatepicker(context),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Image(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          '/images/vector_year/dragon.png'),
                                    ),
                                    const SizedBox(
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
                              const Expanded(
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
                                    const Image(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          '/images/vector_year/pig.png'),
                                    ),
                                    const SizedBox(
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
      bottomNavigationBar: Visibility(
        maintainSize: !isResult,
        maintainAnimation: true,
        maintainState: true,
        visible: !isResult,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
            disabledBackgroundColor: textGreyColor,
            shadowColor: blueColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            minimumSize: const Size(double.infinity, 45),
          ),
          onPressed: () {
            setState(() {
              isResult = !isResult;
            });
          },
          child: Text(
            languages[42].kh,
            style: GoogleFonts.notoSerifKhmer(
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
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

  _openBoyDatepicker(BuildContext context) async {
    final DateTime? dob = await showDatePicker(
      context: context,
      initialDate: selectedBoyDate,
      firstDate: startDate,
      lastDate: lasttDate,
    );

    if (dob != null) {
      setState(() {
        selectedBoyDate = dob;
        String formattedDate = DateFormat('dd/MM/yyyy').format(selectedBoyDate);
        _textBoyEditingController.text = formattedDate;
      });
    }
  }

  _openGirlDatepicker(BuildContext context) async {
    final DateTime? dob = await showDatePicker(
      context: context,
      initialDate: selectedGirlDate,
      firstDate: startDate,
      lastDate: lasttDate,
    );

    if (dob != null) {
      setState(() {
        selectedGirlDate = dob;
        String formattedDate =
            DateFormat('dd/MM/yyyy').format(selectedGirlDate);
        _textGirlEditingController.text = formattedDate;
      });
    }
  }
}
