import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String logo = "/images/carousel/monkey.png";

  TextEditingController _textEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final startDate = DateTime(1969, 1);
  final lasttDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color canvasColor = Theme.of(context).canvasColor;
    Color bodyColor = const Color(0XFFF5F6FB);
    Color textGrey = const Color(0XFFABABAB);

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
                            height: 35.0,
                            child: Text(
                              "Sign Up",
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
                        prefixIcon: const Icon(
                          CupertinoIcons.person_crop_circle,
                          color: Color(0XFFD9328A),
                        ),
                        hintText: "Full Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0XFFC9CCD0), width: 1.0),
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
                      controller: _textEditingController,
                      onTap: () => _openDatepicker(context),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: canvasColor,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          FeatherIcons.calendar,
                          color: Color(0XFFD9328A),
                        ),
                        hintText: "Date of Birth",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0XFFC9CCD0), width: 1.0),
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
                    TextField(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: canvasColor,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          CupertinoIcons.escape,
                          color: Color(0XFFD9328A),
                        ),
                        hintText: "Gender",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0XFFC9CCD0), width: 1.0),
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
                    TextField(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: canvasColor,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          FeatherIcons.phone,
                          color: Color(0XFFD9328A),
                        ),
                        hintText: "Phone Number",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
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
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: Column(children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFF008DD4),
                        onPrimary: Colors.white,
                        shadowColor: const Color(0XFF008DD4),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Send Code",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
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
                              "By signing up you accept our ",
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w400,
                                  color: textGrey),
                            ),
                            Text(
                              "Terms & Conditions.",
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor),
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
                      children: const [
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: Colors.black26,
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Or sign up with"),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: Colors.black26,
                        )),
                      ],
                    ),
                    SizedBox(
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
      )),
    );
  }

  _openDatepicker(BuildContext context) async {
    final DateTime? dob = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: startDate,
      lastDate: lasttDate,
    );

    if (dob != null) {
      setState(() {
        selectedDate = dob;
        String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        _textEditingController.text = formattedDate;
      });
    }
  }
}
