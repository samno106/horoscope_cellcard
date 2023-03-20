import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/colors.dart';
import 'package:horoscope_cellcard/wegets/horoscope_card.dart';

import '../../constants/horoscope_property.dart';
import '../../constants/language.dart';
import '../../layouts/top_navbar.dart';
import '../../wegets/curved_bottom_clipper.dart';

class HoroscopePage extends StatefulWidget {
  const HoroscopePage({Key? key}) : super(key: key);

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
        mainAxisSize: MainAxisSize.max,
        children: [
          const TopNavbar(),
          Container(
            padding: const EdgeInsets.all(0.0),
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
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 20.0, bottom: 80.0),
                itemCount: horoscopeIcons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return HoroscopeCard(
                    img: horoscopeIcons[index],
                    name: horoscopeTitle[index],
                    route: horoscopeRoute[index],
                  );
                }),
          ),
        ],
      )),
    );
  }
}
