import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';

import '../../constants/colors.dart';
import '../../services/get_user_loged_service.dart';
import '../../utils/shared_prefs.dart';
import '../../wegets/curved_bottom_clipper.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _sigenedInUser = Get.put(GetUserLogedService());

  String? full_name;
  String? phone_number;
  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Future<void> getProfile() async {
    var user = await SharedPrefs().getUser();

    if (user != null) {
      var result = jsonDecode(user!);
      setState(() {
        full_name = result['full_name'];
        phone_number = result['phone_number'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          languages[50].kh,
          style: GoogleFonts.koulen(
            textStyle: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: textDarkColor),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            FeatherIcons.chevronLeft,
            size: 30.0,
            color: canvasColor,
          ),
          onPressed: () {
            Get.toNamed('/');
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
                                padding: const EdgeInsets.all(16),
                                onPressed: () {},
                                color: grayColor,
                                textColor: blueColor,
                                elevation: 0.0,
                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1.0, color: blueColor)),
                                child: const Icon(
                                  CupertinoIcons.camera_fill,
                                  size: 18.0,
                                ),
                              ),
                            ),
                          ]),
                        )),
                  ],
                ),
              ),
              Center(
                child: Text(
                  full_name.toString(),
                  style: TextStyle(
                    color: textDarkColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  phone_number.toString(),
                  style: TextStyle(
                    color: textDarkColor,
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
                          onTap: () => {Get.toNamed('/profile')},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(children: [
                                  Image(
                                      width: 24,
                                      height: 24,
                                      image: AssetImage(iconPack[0])),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    languages[79].kh,
                                    style: GoogleFonts.notoSansKhmer(
                                        textStyle: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ]),
                              ),
                              Icon(
                                FeatherIcons.chevronRight,
                                size: 18.0,
                                color: blueColor,
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Divider(
                        thickness: 1,
                        color: lightBlueColor,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed('/my-subscribe');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(children: [
                                  Image(
                                      width: 24,
                                      height: 24,
                                      image: AssetImage(iconPack[1])),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    languages[80].kh,
                                    style: GoogleFonts.notoSansKhmer(
                                        textStyle: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ]),
                              ),
                              Icon(
                                FeatherIcons.chevronRight,
                                size: 18.0,
                                color: blueColor,
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        thickness: 1,
                        color: lightBlueColor,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 35.0,
                        child: Center(
                          child: GestureDetector(
                              onTap: () async {
                                await SharedPrefs().removeUser();
                                _sigenedInUser.isUserSignedIn();
                                Get.offAllNamed('/');
                              },
                              child: Text(
                                languages[81].kh,
                                style: GoogleFonts.notoSansKhmer(
                                    textStyle: TextStyle(
                                  color: blueColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> iconPack = <String>[
  '/images/icons/iconProfile.png',
  '/images/icons/iconPack.png',
];
