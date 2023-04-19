import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';
import 'package:horoscope_cellcard/controllers/login_controller.dart';
import '../../constants/colors.dart';

class OtpLoginPage extends StatefulWidget {
  const OtpLoginPage({super.key});

  @override
  State<OtpLoginPage> createState() => _OtpLoginPageState();
}

class _OtpLoginPageState extends State<OtpLoginPage> {
  final loginController = Get.find<LoginController>();

  String phoneNumber = "";

  bool _onEditing = true;
  String _code = '';

  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    setState(() {
      phoneNumber = loginController.phoneNumberController.text;
    });
    resendCode();
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
                            phoneNumber,
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
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        itemSize: 35.0,
                        digitsOnly: true,
                        autofocus: true,
                        onCompleted: (String value) {
                          updatedCompleted(value);
                        },
                        onEditing: (bool value) {
                          updatedEditing(value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${languages[76].kh} $_start s',
                        style: GoogleFonts.notoSansKhmer(
                            textStyle: TextStyle(
                          color: textDarkColor,
                          fontSize: 14.0,
                        )),
                      ),
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
                        loginController.login();
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
    );
  }

  void updatedCompleted(String val) {
    setState(() {
      _code = val;
      loginController.otpCodeController.text = val;
    });
  }

  void updatedEditing(bool val) {
    setState(() {
      _onEditing = val;
      _code = '';
    });

    if (!_onEditing) FocusScope.of(context).unfocus();
  }

  void resendCode() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        setState(() {
          _start = 0;
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
