import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class AccountCreatedPage extends StatefulWidget {
  const AccountCreatedPage({super.key});

  @override
  State<AccountCreatedPage> createState() => _AccountCreatedPageState();
}

class _AccountCreatedPageState extends State<AccountCreatedPage> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color canvasColor = Theme.of(context).canvasColor;
    Color bodyColor = Color(0XFFF5F6FB);
    Color textGrey = Color(0XFFABABAB);
    return Scaffold(
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
                child: Column(children: [
                  Container(
                    child:
                        Image(image: AssetImage("/images/icons/checked.png")),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Account has been created!",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF2C3E50)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Center(
                      child: Text(
                        "Thank you for signing up with Horoscope.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF2C3E50)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0XFF008DD4),
                  onPrimary: Colors.white,
                  shadowColor: const Color(0XFF008DD4),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  Get.toNamed('home');
                },
                child: const Text(
                  "OK",
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
