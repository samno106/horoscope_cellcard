import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/layouts/base_navbar.dart';
import 'package:horoscope_cellcard/wegets/subscibe_card.dart';

import '../../constants/colors.dart';
import '../../constants/language.dart';
import '../../constants/profile_lists.dart';
import '../../wegets/curved_bottom_clipper.dart';

class MySubscribePage extends StatefulWidget {
  const MySubscribePage({super.key});

  @override
  State<MySubscribePage> createState() => _MySubscribePageState();
}

class _MySubscribePageState extends State<MySubscribePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    top: 90,
                    left: MediaQuery.of(context).size.width * 0.37,
                    child: Container(
                      padding: const EdgeInsets.all(0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          "/images/profile/base_profile.png",
                          height: 100.0,
                          width: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: BaseNavbar(title: languages[80].kh),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              languages[82].kh,
              style: GoogleFonts.notoSansKhmer(
                  textStyle: TextStyle(
                color: textDarkColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              )),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                languages[83].kh,
                style: GoogleFonts.notoSansKhmer(
                    textStyle: TextStyle(
                        color: textDarkColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        height: 1.5)),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            padding: const EdgeInsets.all(0.0),
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: ListView(
              children: [
                SubscribeCard(
                  img: profiles[0],
                  name: "Master. Khit Samno",
                  price: 0.50,
                ),
                SubscribeCard(
                  img: profiles[1],
                  name: "Master. Vanna Noue",
                  price: 0.25,
                ),
              ],
            ),
          )
        ],
      ))),
    );
  }
}
