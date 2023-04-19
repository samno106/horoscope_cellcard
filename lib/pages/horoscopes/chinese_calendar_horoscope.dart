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

class ChCalendarHoroscopePage extends StatefulWidget {
  const ChCalendarHoroscopePage({super.key});

  @override
  State<ChCalendarHoroscopePage> createState() =>
      _ChCalendarHoroscopePageState();
}

class _ChCalendarHoroscopePageState extends State<ChCalendarHoroscopePage> {
  int selectedYearName = 0;

  AudioPlayer audioPlayer = AudioPlayer();
  late Source audioUrl;
  Duration duration = const Duration();
  Duration position = const Duration();

  bool playing = false;
  bool isResult = false;

  //show date
  String showDate = '';
  // final DateTime _selectedDate = DateTime.now();

  //show month
  String showMonth = '';
  // DateTime _selectedMonth = DateTime.now();

  //show year
  String showYear = '';
  DateTime _selectedYear = DateTime.now();

  selectDate(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              languages[29].kh,
              style: GoogleFonts.notoSansKhmer(
                  textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.7,
              child: GridView.builder(
                  itemCount: 31,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(color: textDarkColor, fontSize: 18.0),
                      ),
                    );
                  }),
            ),
          );
        });
  }

  selectMonth(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              languages[30].kh,
              style: GoogleFonts.notoSansKhmer(
                  textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.7,
              child: null,
            ),
          );
        });
  }

  selectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              languages[31].kh,
              style: GoogleFonts.notoSansKhmer(
                  textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
            ),
            content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.7,
                child: YearPicker(
                    firstDate: DateTime(1600, 1),
                    lastDate: DateTime(DateTime.now().year),
                    selectedDate: _selectedYear,
                    onChanged: (DateTime dateTime) {
                      setState(() {
                        _selectedYear = dateTime;
                        showYear = "${dateTime.year}";
                      });
                      Navigator.pop(context);
                    })),
          );
        });
  }

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
            height: 270.0,
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
                    title: languages[48].kh,
                  ),
                ),
                Positioned(
                  top: 70,
                  child: CustomPaint(
                    painter: PathPainter(drawPath()),
                  ),
                ),
                const Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 196.0,
                    width: 146.0,
                    child: Image(
                        image: AssetImage('/images/vector/ch_vector.png')),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languages[48].kh,
                    style: GoogleFonts.notoSansKhmer(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textDarkColor)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40.0,
                          child: TextField(
                            style: GoogleFonts.notoSansKhmer(
                                textStyle: TextStyle(
                              fontSize: 14.0,
                              color: canvasColor,
                            )),
                            onTap: () {
                              selectDate(context);
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                FeatherIcons.chevronDown,
                                color: primaryColor,
                                size: 20.0,
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                maxHeight: 50.0,
                              ),
                              hintText: languages[35].kh,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: borderColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(6.0)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1.0),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40.0,
                          child: TextField(
                            style: GoogleFonts.notoSansKhmer(
                                textStyle: TextStyle(
                              fontSize: 14.0,
                              color: canvasColor,
                            )),
                            onTap: () {
                              selectMonth(context);
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                FeatherIcons.chevronDown,
                                color: primaryColor,
                                size: 20.0,
                              ),
                              suffixIconConstraints:
                                  const BoxConstraints(maxHeight: 50.0),
                              hintText: languages[36].kh,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: borderColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(6.0)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1.0),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40.0,
                          child: TextField(
                            style: GoogleFonts.notoSansKhmer(
                                textStyle: TextStyle(
                              fontSize: 14.0,
                              color: canvasColor,
                            )),
                            onTap: () {
                              selectYear(context);
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                FeatherIcons.chevronDown,
                                color: primaryColor,
                                size: 20.0,
                              ),
                              suffixIconConstraints:
                                  const BoxConstraints(maxHeight: 50.0),
                              hintText: languages[37].kh,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: borderColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(6.0)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1.0),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: buttonPrimaryColor,
                            shadowColor: blueColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: const Size(40.0, 47.0),
                          ),
                          onPressed: () {
                            setState(() {
                              isResult = true;
                            });
                          },
                          child: Text(
                            languages[17].kh,
                            style: GoogleFonts.notoSansKhmer(
                                textStyle: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ),
                      )
                    ],
                  )
                ],
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
                        style: GoogleFonts.notoSansKhmer(
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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  ? Icon(FeatherIcons.play, color: blueColor)
                                  : Icon(FeatherIcons.pause,
                                      color: primaryColor),
                            ),
                            Container(
                              padding: const EdgeInsets.all(0.0),
                              child: Slider(
                                min: 0.0,
                                thumbColor: primaryColor,
                                activeColor: primaryColor,
                                inactiveColor:
                                    const Color.fromARGB(255, 255, 225, 169),
                                value: position.inSeconds.toDouble(),
                                max: duration.inSeconds.toDouble(),
                                onChanged: (double value) => {
                                  setState(() => {
                                        audioPlayer.seek(
                                            Duration(seconds: value.toInt()))
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
                      ),
                      const SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ))),
    );
  }

  void getAudio() async {
    audioUrl = UrlSource("http://localhost:58637/assets/sounds/audio1.mp3");

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
