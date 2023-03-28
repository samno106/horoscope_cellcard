import 'package:flutter/material.dart';

import 'package:horoscope_cellcard/constants/language.dart';
import 'package:horoscope_cellcard/layouts/premium_navbar.dart';

import '../../constants/colors.dart';
import '../../constants/profile_lists.dart';
import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/subscibe_card.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
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
          PremiumNavbar(title: languages[23].kh),
          Container(
            padding: const EdgeInsets.all(0.0),
            height: 140.0,
            child: Stack(
              children: <Widget>[
                ClipPath(
                    clipper: CurvedBottomClipper(),
                    child: Container(
                      color: primaryColor,
                      height: 110.0,
                      width: MediaQuery.of(context).size.width,
                      child: null,
                    )),
                Positioned(
                    top: 35,
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
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 80.0, top: 10.0),
            margin: const EdgeInsets.only(bottom: 50.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
              shrinkWrap: false,
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
                SubscribeCard(
                  img: profiles[1],
                  name: "Master. Vanna Noue",
                  price: 0.25,
                ),
                SubscribeCard(
                  img: profiles[1],
                  name: "Master. Vanna Noue",
                  price: 0.25,
                ),
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
