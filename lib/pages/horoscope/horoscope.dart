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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Stack(
              children: <Widget>[
                ClipPath(
                    clipper: CurvedBottomClipper(),
                    child: Container(
                      color: primaryColor,
                      height: 170.0,
                      width: MediaQuery.of(context).size.width,
                      child: null,
                    )),
                const Positioned(
                  top: 0.0,
                  left: 0,
                  right: 0,
                  child: TopNavbar(),
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
                          languages[21].kh,
                          style: GoogleFonts.koulen(
                              textStyle: TextStyle(
                            color: textDarkColor,
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                          )),
                        )
                      ]),
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 20.0),
                itemCount: horoscopeIcons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  mainAxisExtent: 170,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return HoroscopeCard(
                    img: horoscopeIcons[index],
                    name: horoscopeTitle[index],
                    route: horoscopeRoute[index],
                  );
                }),
          ),
          const SizedBox(
            height: 50.0,
          )
        ],
      )),
    );
  }
}
