
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';

import '../../constants/colors.dart';
import '../../controllers/user_controller.dart';
import '../../wegets/curved_bottom_clipper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userController = Get.put(UserController());

  onEdit() {
    setState(() {
      userController.isSuccess.value = !userController.isSuccess.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          title: Text(
            languages[59].kh,
            style: GoogleFonts.koulen(
              textStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: textDarkColor,
                height: 2.5,
              ),
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
              Get.toNamed('account');
            },
          ),
        ),
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: !userController.isLoading.value
              ? SingleChildScrollView(
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
                                      borderRadius:
                                          BorderRadius.circular(100.0),
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
                                              side: BorderSide(
                                                  width: 1.0,
                                                  color: blueColor)),
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
                            onPressed: () => {onEdit()},
                            child: Text(
                              languages[60].kh,
                              style: GoogleFonts.koulen(
                                textStyle: TextStyle(
                                  color: blueColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  height: 2.5,
                                ),
                              ),
                            )),
                      ),
                      !userController.isSuccess.value
                          ? Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              width: double.infinity,
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              languages[64].kh,
                                              style: GoogleFonts.notoSansKhmer(
                                                  textStyle: TextStyle(
                                                      color: textDarkColor,
                                                      fontSize: 13)),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              userController
                                                  .userModel[0].fullName,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              languages[65].kh,
                                              style: GoogleFonts.notoSansKhmer(
                                                  textStyle: TextStyle(
                                                      color: textDarkColor,
                                                      fontSize: 13)),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              userController.userModel[0].dob,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              languages[66].kh,
                                              style: GoogleFonts.notoSansKhmer(
                                                  textStyle: TextStyle(
                                                      color: textDarkColor,
                                                      fontSize: 13)),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              userController
                                                  .userModel[0].gender,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              languages[67].kh,
                                              style: GoogleFonts.notoSansKhmer(
                                                  textStyle: TextStyle(
                                                      color: textDarkColor,
                                                      fontSize: 13)),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              userController
                                                  .userModel[0].phoneNumber,
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
                          : Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              width: double.infinity,
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              languages[64].kh,
                                              style: GoogleFonts.notoSansKhmer(
                                                  textStyle: TextStyle(
                                                      color: textDarkColor,
                                                      fontSize: 13)),
                                            ),
                                            TextField(
                                                controller: userController
                                                    .fullNameController,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: canvasColor,
                                                ),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                )),
                                          ]),
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              languages[65].kh,
                                              style: GoogleFonts.notoSansKhmer(
                                                  textStyle: TextStyle(
                                                      color: textDarkColor,
                                                      fontSize: 13)),
                                            ),
                                            TextField(
                                                controller: userController
                                                    .dobController,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: canvasColor,
                                                ),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ))
                                          ]),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              languages[66].kh,
                                              style: GoogleFonts.notoSansKhmer(
                                                  textStyle: TextStyle(
                                                      color: textDarkColor,
                                                      fontSize: 13)),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            SizedBox(
                                              child: Row(children: [
                                                CustomRadioButton(
                                                  elevation: 0,
                                                  absoluteZeroSpacing: true,
                                                  radius: 10.0,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0),
                                                  unSelectedColor:
                                                      Theme.of(context)
                                                          .canvasColor,
                                                  defaultSelected:
                                                      userController
                                                          .userModel[0].gender,
                                                  buttonLables: [
                                                    languages[68].kh,
                                                    languages[69].kh,
                                                  ],
                                                  buttonValues: const [
                                                    "male",
                                                    "female",
                                                  ],
                                                  buttonTextStyle: ButtonTextStyle(
                                                      selectedColor:
                                                          Colors.white,
                                                      unSelectedColor:
                                                          Colors.black,
                                                      textStyle: GoogleFonts
                                                          .notoSansKhmer(
                                                              textStyle:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          14))),
                                                  radioButtonValue: (value) {
                                                    userController
                                                            .genderController
                                                            .text =
                                                        value.toString();
                                                  },
                                                  selectedColor: primaryColor,
                                                  enableShape: true,
                                                  shapeRadius: 10.0,
                                                )
                                              ]),
                                            )
                                          ]),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: lightBlueBorderColor,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              languages[67].kh,
                                              style: GoogleFonts.notoSansKhmer(
                                                  textStyle: TextStyle(
                                                      color: textDarkColor,
                                                      fontSize: 13)),
                                            ),
                                            TextField(
                                                controller: userController
                                                    .phoneNumberController,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: canvasColor,
                                                ),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            lightBlueBorderColor),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ))
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      userController.isSuccess.value
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 45.0,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: buttonPrimaryColor,
                                    shadowColor: blueColor,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                  ),
                                  child: Text(
                                    languages[61].kh,
                                    style: GoogleFonts.koulen(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        height: 2.5,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    userController.updateUserData();
                                  }),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                            )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
