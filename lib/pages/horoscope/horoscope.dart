import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/colors.dart';
import 'package:horoscope_cellcard/wegets/horoscope_card.dart';

import '../../constants/horoscope_property.dart';
import '../../constants/language.dart';
import '../../layouts/top_navbar.dart';

class HoroscopePage extends StatefulWidget {
  HoroscopePage({Key? key}) : super(key: key);

  @override
  State<HoroscopePage> createState() => _HoroscopePageState();
}

class _HoroscopePageState extends State<HoroscopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TopNavbar(),
          Container(
            height: 100.0,
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
                          languages[21].kh,
                          style: GoogleFonts.moulpali(
                              textStyle: TextStyle(
                            color: textDarkColor,
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ]),
                    )),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: GridView.builder(
                padding: const EdgeInsets.only(top: 10.0, bottom: 80.0),
                itemCount: horoscopeIcons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return HoroscopeCard(
                      img: horoscopeIcons[index], name: horoscopeTitle[index]);
                }),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      )),
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
