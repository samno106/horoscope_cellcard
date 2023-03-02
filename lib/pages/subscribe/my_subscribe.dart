import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class MySubscribePage extends StatefulWidget {
  const MySubscribePage({super.key});

  @override
  State<MySubscribePage> createState() => _MySubscribePageState();
}

class _MySubscribePageState extends State<MySubscribePage> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color canvasColor = Theme.of(context).canvasColor;
    Color bodyColor = Color(0XFFF5F6FB);
    Color textGrey = Color(0XFFABABAB);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          "My Subscription",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0XFF2C3E50)),
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
      backgroundColor: bodyColor,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 160.0,
            child: Stack(
              children: <Widget>[
                ClipPath(
                    clipper: CurvedBottomClipper(),
                    child: Container(
                      color: primaryColor,
                      height: 120.0,
                      width: MediaQuery.of(context).size.width,
                      child: null,
                    )),
                Positioned(
                    top: 50,
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
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "You do not have any subscription.",
              style: TextStyle(
                color: Color(0XFF2C3E50),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "Select any Master below to see details or suscribe to have full access to our Horoscope.",
                style: TextStyle(
                    color: Color(0XFF2C3E50),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    height: 1.5),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  height: 150.0,
                  width: double.infinity,
                  child: Text("Item 1"),
                ),
              ],
            ),
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
