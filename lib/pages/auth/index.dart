import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String logo = "/images/carousel/monkey.png";

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
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 80.0,
              width: 80.0,
              child: Image(image: AssetImage(logo)),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.0,
                      child: Text(
                        "You are not logged in",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: canvasColor),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                      child: Text(
                        "Log in or sign up to continue",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: textGrey),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF008DD4),
                  onPrimary: Colors.white,
                  shadowColor: Color(0XFF008DD4),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  minimumSize: Size(MediaQuery.of(context).size.width, 45),
                ),
                onPressed: () {
                  Get.toNamed('signup');
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              OutlinedButton(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  primary: Color(0XFF008DD4),
                  backgroundColor: bodyColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  minimumSize: Size(MediaQuery.of(context).size.width, 45),
                  side: BorderSide(width: 1.0, color: Color(0XFF008DD4)),
                ),
                onPressed: () {
                  Get.toNamed('signin');
                },
              )
            ]),
          )
        ],
      )),
    );
  }
}
