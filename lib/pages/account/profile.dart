import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../wegets/curved_bottom_clipper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: textDarkColor),
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
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
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
                      padding: const EdgeInsets.all(0.0),
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
                              color: grayColor,
                              textColor: blueColor,
                              elevation: 0.0,
                              padding: const EdgeInsets.all(16),
                              shape: CircleBorder(
                                  side:
                                      BorderSide(width: 1.0, color: blueColor)),
                              child: const Icon(
                                CupertinoIcons.camera_fill,
                                size: 18,
                              ),
                            )),
                      ]),
                    )),
              ],
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () => {},
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline),
                )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              height: 325.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style:
                                TextStyle(color: textDarkColor, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Khit Samno",
                            style: TextStyle(
                              color: textDarkColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    thickness: 1,
                    color: lightBlueColor,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date of Birth",
                            style:
                                TextStyle(color: textDarkColor, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "23 - 04 - 2023",
                            style: TextStyle(
                              color: textDarkColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    thickness: 1,
                    color: lightBlueColor,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style:
                                TextStyle(color: textDarkColor, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              color: textDarkColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    thickness: 1,
                    color: lightBlueColor,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone Number",
                            style:
                                TextStyle(color: textDarkColor, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "012 999 988",
                            style: TextStyle(
                              color: textDarkColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ))),
    );
  }
}
