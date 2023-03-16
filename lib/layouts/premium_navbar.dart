import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class PremiumNavbar extends StatelessWidget {
  const PremiumNavbar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    bool auth = false;

    return Container(
      color: primaryColor,
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.title,
                style: GoogleFonts.notoSerifKhmer(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textDarkColor)),
              ),
            ],
          )),
    );
  }
}
