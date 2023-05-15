import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/language.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String logo = "/images/carousel/monkey.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            FeatherIcons.chevronLeft,
            size: 30.0,
            color: canvasColor,
          ),
          onPressed: () {
            print('Go Back');
            Get.toNamed('/');
          },
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 80.0,
              width: 80.0,
              child: Image(image: AssetImage(logo)),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.0,
                      child: Text(
                        languages[62].kh,
                        style: GoogleFonts.notoSansKhmer(
                            textStyle: TextStyle(
                          color: canvasColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                      child: Text(
                        languages[63].kh,
                        style: GoogleFonts.notoSansKhmer(
                            textStyle: TextStyle(
                          color: textGreyColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: buttonPrimaryColor,
                  shadowColor: blueColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  minimumSize: Size(MediaQuery.of(context).size.width, 45),
                ),
                onPressed: () {
                  Get.toNamed('/signup');
                },
                child: Text(
                  languages[14].kh,
                  style: GoogleFonts.notoSansKhmer(
                      textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: blueColor,
                  backgroundColor: backgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  minimumSize: Size(MediaQuery.of(context).size.width, 45),
                  side: BorderSide(width: 1.0, color: blueColor),
                ),
                onPressed: () {
                  Get.toNamed('/signin');
                },
                child: Text(
                  languages[15].kh,
                  style: GoogleFonts.notoSansKhmer(
                      textStyle: TextStyle(
                    color: blueColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}
