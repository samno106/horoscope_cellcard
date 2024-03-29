import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class NotifiNavbar extends StatelessWidget {
  const NotifiNavbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                '$title (5)',
                style: GoogleFonts.notoSansKhmer(
                    textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: textDarkColor)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        FeatherIcons.moreVertical,
                        size: 30.0,
                        color: canvasColor,
                      ),
                      onPressed: () {
                        Get.toNamed('/');
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
