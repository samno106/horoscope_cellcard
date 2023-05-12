import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/controllers/register_controller.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../constants/language.dart';
import '../../utils/dob_text_formatter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String logo = "/images/carousel/monkey.png";

  final registerController = Get.find<RegisterController>();

  FocusNode focusNode = FocusNode();
  String hintText = languages[65].kh;

  String _genderValue = "";

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = languages[89].kh;
      } else {
        hintText = languages[65].kh;
      }
      setState(() {});
    });
  }

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
            Get.back();
          },
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 12),
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: Image(image: AssetImage(logo)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 45.0,
                            child: Text(
                              languages[14].kh,
                              style: GoogleFonts.notoSansKhmer(
                                  textStyle: TextStyle(
                                color: canvasColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(children: [
                    TextField(
                      controller: registerController.fullNameController,
                      style: GoogleFonts.notoSansKhmer(
                          textStyle: TextStyle(
                        fontSize: 14.0,
                        color: canvasColor,
                      )),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          CupertinoIcons.person_crop_circle,
                          color: iconColor,
                        ),
                        hintText: languages[64].kh,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: borderColor, width: 1.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: registerController.dobController,
                      style: GoogleFonts.notoSansKhmer(
                          textStyle: TextStyle(
                        fontSize: 14.0,
                        color: canvasColor,
                      )),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                        DobTextFormatter()
                      ],
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          FeatherIcons.calendar,
                          color: iconColor,
                        ),
                        hintText: hintText,
                        // hintText: languages[65].kh,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: borderColor, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 5.0),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          CupertinoIcons.escape,
                          color: iconColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: borderColor, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      iconEnabledColor: blueColor,
                      hint: _genderValue == ""
                          ? Text(
                              languages[66].kh,
                              style: GoogleFonts.notoSansKhmer(
                                  textStyle: TextStyle(
                                color: canvasColor,
                                fontSize: 14.0,
                              )),
                            )
                          : Text(
                              _genderValue,
                              style: TextStyle(
                                color: textDarkColor,
                                fontSize: 14.0,
                              ),
                            ),
                      isExpanded: true,
                      isDense: true,
                      style: GoogleFonts.notoSansKhmer(
                        textStyle: TextStyle(
                          color: canvasColor,
                          fontSize: 14.0,
                        ),
                      ),
                      items: [languages[68].kh, languages[69].kh].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(
                              val,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: canvasColor,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            registerController.genderController.text = val!;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: registerController.phoneNumberController,
                      style: GoogleFonts.notoSansKhmer(
                          textStyle: TextStyle(
                        fontSize: 14.0,
                        color: canvasColor,
                      )),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          FeatherIcons.phone,
                          color: iconColor,
                        ),
                        hintText: languages[67].kh,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: borderColor, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: buttonPrimaryColor,
                        shadowColor: blueColor,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                      ),
                      onPressed: () => {registerController.registerSendOtp()},
                      child: Text(
                        languages[16].kh,
                        style: GoogleFonts.notoSansKhmer(
                            textStyle: const TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      height: 35.0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              languages[70].kh,
                              style: GoogleFonts.notoSansKhmer(
                                  textStyle: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      color: textGreyColor)),
                            ),
                            Text(
                              languages[71].kh,
                              style: GoogleFonts.notoSansKhmer(
                                  textStyle: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor)),
                            )
                          ]),
                    )
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: textBlackColor,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          languages[72].kh,
                          style: GoogleFonts.notoSansKhmer(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: Colors.black26,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('/images/icons/facebook.png'),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          IconButton(
                            icon: Image.asset('/images/icons/google.png'),
                            iconSize: 40,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      child: TextButton(
                          onPressed: () => {Get.toNamed('/')},
                          child: Text(
                            languages[19].kh,
                            style: GoogleFonts.notoSansKhmer(
                                textStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor)),
                          )),
                    ),
                  ]),
                )
              ],
            )),
      )),
    );
  }
}
