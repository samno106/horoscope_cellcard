import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/language.dart';
import '../constants/navbar_property.dart';

class BaseNavbar extends StatelessWidget {
  const BaseNavbar({Key? key, required this.title}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        FeatherIcons.chevronLeft,
                        size: 30.0,
                        color: canvasColor,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              Text(
                this.title,
                style: GoogleFonts.notoSerifKhmer(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textDarkColor)),
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          )),
    );
  }
}
