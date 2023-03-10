import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/profile_lists.dart';
import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/subscibe_card.dart';

class PremiumPage extends StatefulWidget {
  PremiumPage({Key? key}) : super(key: key);

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          "Premium",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: textDarkColor),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
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
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: ListView(
              padding: const EdgeInsets.only(top: 20.0, bottom: 100.0),
              shrinkWrap: true,
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
          SizedBox(
            height: 30.0,
          ),
        ],
      ))),
    );
  }
}
