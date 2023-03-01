import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String phoneNumber = "0123599987";

  bool _onEditing = true;
  String _code = '';

  late Timer _timer;
  int _start = 60;

  void resendCode() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 0;
          _timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    resendCode();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color canvasColor = Theme.of(context).canvasColor;
    Color bodyColor = Color(0XFFF5F6FB);
    Color textGrey = Color(0XFFABABAB);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bodyColor,
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
      backgroundColor: bodyColor,
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
                        child: Center(
                          child: Text(
                            "Enter the 6-digits code we sent to",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF2C3E50)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            phoneNumber,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF2C3E50)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      VerificationCode(
                        length: 6,
                        textStyle: TextStyle(
                          fontSize: 22.0,
                          color: Color(0XFF2C3E50),
                        ),
                        underlineColor: Color(0XFF2C3E50),
                        keyboardType: TextInputType.number,
                        underlineWidth: 2.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        itemSize: 35.0,
                        digitsOnly: true,
                        autofocus: true,
                        onCompleted: (String value) {
                          setState(() {
                            _code = value;
                          });
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                            _code = '';
                          });
                          if (!_onEditing) FocusScope.of(context).unfocus();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Resend code in " + _start.toString(),
                        style: TextStyle(
                          color: Color(0XFF2C3E50),
                          fontSize: 12.0,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Colors.grey,
                  primary: const Color(0XFF008DD4),
                  onPrimary: Colors.white,
                  shadowColor: const Color(0XFF008DD4),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: _code.length < 6
                    ? null
                    : () {
                        Get.toNamed('account-created');
                      },
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
