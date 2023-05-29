import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';
import 'package:horoscope_cellcard/controllers/login_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../constants/colors.dart';

class OtpLoginPage extends StatefulWidget {
  const OtpLoginPage({super.key});

  @override
  State<OtpLoginPage> createState() => _OtpLoginPageState();
}

class _OtpLoginPageState extends State<OtpLoginPage> {
  final loginController = Get.put(LoginController());

  bool _onEditing = true;
  String _code = '';

  late Timer _timer;
  int _start = 40;
  bool resend = false;

  @override
  void initState() {
    super.initState();
    resendCode();
  }

  @override
  void dispose() {
    loginController.phoneNumberController.dispose();
    _timer.cancel();
    super.dispose();
  }

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
              Get.offAllNamed('signin');
            },
          ),
        ),
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: GetBuilder<LoginController>(
                builder: ((controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Center(
                                    child: Text(
                                      languages[75].kh,
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
                                  child: Center(
                                    child: Text(
                                      loginController
                                          .phoneNumberController.text,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: textDarkColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                VerificationCode(
                                  length: 6,
                                  textStyle: TextStyle(
                                    fontSize: 22.0,
                                    color: textDarkColor,
                                  ),
                                  underlineColor: textDarkColor,
                                  keyboardType: TextInputType.number,
                                  underlineWidth: 2.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  itemSize: 35.0,
                                  digitsOnly: true,
                                  autofocus: true,
                                  onCompleted: (String value) {
                                    controller.otpCodeController.text = value;
                                    _code = value;
                                  },
                                  onEditing: (bool value) {
                                    updatedEditing(value);
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                resend == false
                                    ? Text(
                                        '${languages[76].kh} 0:$_start s',
                                        style: GoogleFonts.notoSansKhmer(
                                            textStyle: TextStyle(
                                          color: textDarkColor,
                                          fontSize: 14.0,
                                        )),
                                      )
                                    : TextButton(
                                        onPressed: () => {
                                              loginController.loginSendOtp(),
                                              setState(() {
                                                _start = 40;
                                                resend = false;
                                              }),
                                              resendCode()
                                            },
                                        child: Text(
                                          languages[90].kh,
                                          style: GoogleFonts.notoSansKhmer(
                                              textStyle: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          )),
                                        )),
                              ]),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: buttonPrimaryColor,
                            disabledBackgroundColor: textGreyColor,
                            shadowColor: blueColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                            minimumSize: const Size(double.infinity, 60),
                          ),
                          onPressed: _code.length < 6
                              ? null
                              : () {
                                  loginController.confirmOtp();
                                },
                          child: Text(
                            languages[15].kh,
                            style: GoogleFonts.notoSansKhmer(
                                textStyle: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            loginController.isLoading.value
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 180.0),
                      child: LoadingAnimationWidget.hexagonDots(
                        color: primaryColor,
                        size: 0,
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
    );
  }

  void updatedEditing(bool val) {
    setState(() {
      _onEditing = val;
      _code = '';
    });
  }

  void resendCode() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        setState(() {
          _start = 0;
          resend = true;
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }
}
