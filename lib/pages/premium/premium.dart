import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import '../../wegets/subscibe_card.dart';

class PremiumPage extends StatefulWidget {
  PremiumPage({Key? key}) : super(key: key);

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
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
          "Premium",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0XFF2C3E50)),
        ),
        centerTitle: true,
      ),
      backgroundColor: bodyColor,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150.0,
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
            height: 30.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: ListView(
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

const List<String> profiles = <String>[
  "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsynwv-5qtogtOwJbIjaPFJUmHpzhxgqIAug&usqp=CAU"
];
