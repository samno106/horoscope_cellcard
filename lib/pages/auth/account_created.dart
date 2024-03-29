import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';

import '../../constants/colors.dart';

class AccountCreatedPage extends StatefulWidget {
  const AccountCreatedPage({super.key});

  @override
  State<AccountCreatedPage> createState() => _AccountCreatedPageState();
}

class _AccountCreatedPageState extends State<AccountCreatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: const Image(
                        image: AssetImage("/images/icons/checked.png")),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        languages[78].kh,
                        style: GoogleFonts.notoSansKhmer(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: textDarkColor)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Center(
                      child: Text(languages[77].kh,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSansKhmer(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: textDarkColor),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: buttonPrimaryColor,
                  shadowColor: blueColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  minimumSize: const Size(double.infinity, 60),
                ),
                onPressed: () {
                  Get.toNamed('/');
                },
                child: Text(
                  languages[17].kh,
                  style: GoogleFonts.notoSansKhmer(
                      textStyle: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              ),
            ],
          )),
    );
  }
}
