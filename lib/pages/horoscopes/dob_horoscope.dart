import 'package:audioplayers/audioplayers.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/carousel_property.dart';
import '../../constants/colors.dart';
import '../../constants/language.dart';
import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/path_painter.dart';

class DobHoroscopePage extends StatefulWidget {
  const DobHoroscopePage({super.key});

  @override
  State<DobHoroscopePage> createState() => _DobHoroscopePageState();
}

class _DobHoroscopePageState extends State<DobHoroscopePage> {
  int selectedYearName = 0;

  AudioPlayer audioPlayer = new AudioPlayer();
  late Source audioUrl;
  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;

  //show date
  String showDate = '';
  DateTime _selectedDate = DateTime.now();

  //show month
  String showMonth = '';
  DateTime _selectedMonth = DateTime.now();

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
              style: GoogleFonts.notoSerifKhmer(
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
                      padding: EdgeInsets.symmetric(
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
              style: GoogleFonts.notoSerifKhmer(
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
              style: GoogleFonts.notoSerifKhmer(
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
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          languages[27].kh,
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
            height: 130.0,
            child: Stack(
              children: <Widget>[
                ClipPath(
                    clipper: CurvedBottomClipper(),
                    child: Container(
                      color: primaryColor,
                      height: 100.0,
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        Text(
                          listYearName[selectedYearName],
                          style: GoogleFonts.notoSerifKhmer(
                              textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ]),
                    )),
                Positioned(
                    top: 80,
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
                  top: 15,
                  child: CustomPaint(
                    painter: PathPainter(drawPath()),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 55,
            child: Stack(children: [
              Positioned(
                top: 35,
                left: MediaQuery.of(context).size.width / 2.0,
                child: const SizedBox(
                  height: 17.0,
                  width: 21.0,
                  child: Image(image: AssetImage('/images/vector/vector.png')),
                ),
              ),
            ]),
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
                    languages[28].kh,
                    style: GoogleFonts.notoSerifKhmer(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textDarkColor)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: canvasColor,
                          ),
                          onTap: () {
                            selectDate(context);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(
                              FeatherIcons.chevronDown,
                              color: primaryColor,
                              size: 20.0,
                            ),
                            suffixIconConstraints:
                                BoxConstraints(maxHeight: 50.0, minWidth: 20.0),
                            hintText: "Date",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1.0),
                                borderRadius: BorderRadius.circular(6.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 1.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: canvasColor,
                          ),
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
                            hintText: "Month",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1.0),
                                borderRadius: BorderRadius.circular(6.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 1.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: canvasColor,
                          ),
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
                            hintText: "Year",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1.0),
                                borderRadius: BorderRadius.circular(6.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 1.0),
                              borderRadius: BorderRadius.circular(6.0),
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
                            primary: buttonPrimaryColor,
                            onPrimary: Colors.white,
                            shadowColor: blueColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: Size(65.0, 55.0),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Go",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
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
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
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
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Slider(
                    min: 0.0,
                    thumbColor: primaryColor,
                    activeColor: primaryColor,
                    inactiveColor: Color.fromARGB(255, 255, 225, 169),
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    onChanged: (double value) => {
                      setState(() => {
                            audioPlayer
                                .seek(new Duration(seconds: value.toInt()))
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
          SizedBox(
            height: 50.0,
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
