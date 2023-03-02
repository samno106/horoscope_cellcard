import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          "Account",
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
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            "/images/profile/base_profile.png",
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            top: 60.0,
                            right: -20,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Color.fromARGB(203, 255, 255, 255),
                              textColor: Colors.blue,
                              elevation: 0.0,
                              child: Icon(
                                CupertinoIcons.camera_fill,
                                size: 18,
                              ),
                              padding: EdgeInsets.all(16),
                              shape: CircleBorder(
                                  side: BorderSide(
                                      width: 1.0, color: Colors.blue)),
                            )),
                      ]),
                    )),
              ],
            ),
          ),
          Center(
            child: Text(
              "Khit Samno",
              style: TextStyle(
                color: Color(0XFF2C3E50),
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Text(
              "012 999 987",
              style: TextStyle(
                color: Color(0XFF2C3E50),
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => {Get.toNamed('profile')},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Image(
                                  width: 24,
                                  height: 24,
                                  image: AssetImage(iconPack[0])),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "My Profile",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                          ),
                          Icon(
                            FeatherIcons.chevronRight,
                            size: 18.0,
                            color: Colors.blue,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 8.0,
                  ),
                  Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 220, 243, 255),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed('my-subscribe');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Image(
                                  width: 24,
                                  height: 24,
                                  image: AssetImage(iconPack[1])),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "My Subscription",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                          ),
                          Icon(
                            FeatherIcons.chevronRight,
                            size: 18.0,
                            color: Colors.blue,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 220, 243, 255),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () => {},
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  )
                ],
              ),
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

const List<String> iconPack = <String>[
  '/images/icons/iconProfile.png',
  '/images/icons/iconPack.png',
];
