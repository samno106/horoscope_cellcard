import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';
import 'package:horoscope_cellcard/controllers/login_controller.dart';

import '../../constants/colors.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final loginController = Get.put(LoginController());
  bool validate = false;
  String logo = "/images/carousel/monkey.png";

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
              Get.offAllNamed('auth');
            },
          ),
        ),
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 8),
                            width: MediaQuery.of(context).size.width,
                            child: SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: Image(image: AssetImage(logo)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 80.0),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 35.0,
                                      child: Text(languages[73].kh,
                                          style: GoogleFonts.notoSansKhmer(
                                            textStyle: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: canvasColor),
                                          )),
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
                                controller:
                                    loginController.phoneNumberController,
                                style: GoogleFonts.notoSansKhmer(
                                    textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: canvasColor,
                                )),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(9),
                                ],
                                onChanged: (text) => {
                                  text.isEmpty
                                      ? setState(() {
                                          validate = true;
                                        })
                                      : setState(() {
                                          validate = false;
                                        })
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    FeatherIcons.phone,
                                    color: iconColor,
                                  ),
                                  hintText: languages[40].kh,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: validate
                                              ? redColor
                                              : textGreyColor,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(6.0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            validate ? redColor : primaryColor,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              validate ? 'លេខទូរស័ព្ទមិនអាចទទេបានទេ' : '',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.notoSansKhmer(
                                  textStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: redColor)),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: buttonPrimaryColor,
                                      shadowColor: blueColor,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width,
                                          45),
                                    ),
                                    onPressed: () => {
                                      if (loginController
                                          .phoneNumberController.text.isEmpty)
                                        {
                                          setState(() {
                                            validate = true;
                                          })
                                        }
                                      else
                                        {loginController.loginSendOtp()}
                                    },
                                    child: Text(
                                      languages[16].kh,
                                      style: GoogleFonts.notoSansKhmer(
                                          textStyle: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(children: [
                              SizedBox(
                                child: Text(
                                  languages[74].kh,
                                  style: GoogleFonts.notoSansKhmer(
                                      textStyle: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
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
                          ),
                        ],
                      )),
                  loginController.isLoading.value
                      ? Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            color: Color.fromARGB(75, 50, 50, 50),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: blueColor,
                                backgroundColor: Colors.lightBlue,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
