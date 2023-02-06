import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                  margin: EdgeInsets.only(top: 80.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35.0,
                            child: Text(
                              "Login with OTP",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: canvasColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(children: [
                    TextField(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: canvasColor,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          FeatherIcons.phone,
                          color: Color(0XFFD9328A),
                        ),
                        hintText: "Enter Phone Number",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0XFFC9CCD0), width: 1.0),
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
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: Column(children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFF008DD4),
                        onPrimary: Colors.white,
                        shadowColor: Color(0XFF008DD4),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 45),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Send Code",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ]),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      child: Text("Or"),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(
                      child: TextButton(
                          onPressed: () => {},
                          child: Text(
                            "SKIP",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
