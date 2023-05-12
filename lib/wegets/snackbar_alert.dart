import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class SnackbarAlert {
  successAlert(String title, String message) {
    Get.snackbar(
      "Title",
      "Message",
      titleText: Text(
        title,
        style: GoogleFonts.notoSansKhmer(
          textStyle: TextStyle(
            color: blueColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.notoSansKhmer(
          textStyle: TextStyle(
            color: blueColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      icon: Icon(
        CupertinoIcons.checkmark_circle_fill,
        color: blueColor,
        size: 28.0,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 5.0,
      snackStyle: SnackStyle.FLOATING,
      colorText: blueColor,
      margin: const EdgeInsets.all(15),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      boxShadows: const [
        BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(4, 4)),
      ],
    );
  }
}
