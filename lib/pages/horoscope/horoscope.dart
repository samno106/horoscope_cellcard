import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/wegets/horoscope_card.dart';

import '../../layouts/top_navbar.dart';

class HoroscopePage extends StatefulWidget {
  HoroscopePage({Key? key}) : super(key: key);

  @override
  State<HoroscopePage> createState() => _HoroscopePageState();
}

class _HoroscopePageState extends State<HoroscopePage> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color canvasColor = Theme.of(context).canvasColor;
    Color bodyColor = Color(0XFFF5F6FB);
    Color textGrey = Color(0XFFABABAB);

    return Scaffold(
      backgroundColor: bodyColor,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TopNavbar(),
          Container(
            height: 110.0,
            child: Stack(
              children: <Widget>[
                ClipPath(
                    clipper: CurvedBottomClipper(),
                    child: Container(
                      color: primaryColor,
                      height: 110.0,
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        Text(
                          "Horoscope",
                          style: GoogleFonts.mrBedfort(
                              textStyle: TextStyle(
                            color: Color(0XFF2C3E50),
                            fontSize: 62,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ]),
                    )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: GridView.builder(
                itemCount: horoscopeIcons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return HoroscopeCard(
                      img: horoscopeIcons[index], name: horoscopeTitle[index]);
                }),
          )
        ],
      ))),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 3 / 4;

    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    final roundingRectangle = Rect.fromLTRB(
        -4, size.height - roundingHeight * 2, size.width + 4, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

const List<String> horoscopeTitle = <String>[
  "Daily Horoscope",
  "Date of Birth Horoscope",
  "Couple Horoscope",
  "Phone Number Horoscope",
  "Bank Account Number Horoscope",
  "Plate Number Horoscope",
  "Chinese Calendar Horoscope"
];

const List<String> horoscopeIcons = <String>[
  "/images/horoscope_icons/daily.png",
  "/images/horoscope_icons/dob.png",
  "/images/horoscope_icons/couple.png",
  "/images/horoscope_icons/phone_number.png",
  "/images/horoscope_icons/bank_acct.png",
  "/images/horoscope_icons/flat_number.png",
  "/images/horoscope_icons/ch_calendar.png"
];
