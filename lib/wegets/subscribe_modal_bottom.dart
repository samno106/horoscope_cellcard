import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../constants/language.dart';

class SubscribeModalBottom extends StatelessWidget {
  const SubscribeModalBottom(
      {super.key, required this.img, required this.name, required this.price});

  final String img, name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.60,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15), // Image border
                child: Image(
                  fit: BoxFit.cover,
                  width: 100.0,
                  height: 100.0,
                  image: NetworkImage(img),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(
                  color: textDarkColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              textAlign: TextAlign.left,
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget leo quam suspendisse tempor curabitur enim. Rhoncus, est dolor, massa elementum risus. Donec aenean non vitae diam et nisl vitae ementum risus. Donec aenean non vitae diam et nisl vitae ",
              style: TextStyle(
                  color: textDarkColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  height: 1.5),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Divider(
              color: lightBlueBorderColor,
              thickness: 1,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FeatherIcons.disc,
                              size: 8.0,
                              color: iconColor,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              NumberFormat.simpleCurrency(
                                      locale: 'en-US', decimalDigits: 2)
                                  .format(price),
                              style: TextStyle(
                                color: iconColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              languages[53].kh,
                              style: GoogleFonts.notoSansKhmer(
                                textStyle: TextStyle(
                                  color: textDarkColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              FeatherIcons.disc,
                              size: 8.0,
                              color: iconColor,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              languages[54].kh,
                              style: GoogleFonts.notoSansKhmer(
                                textStyle: TextStyle(
                                  color: textDarkColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: buttonPrimaryColor,
                            shadowColor: blueColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: const Size(110.0, 40.0),
                          ),
                          onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (context) => CustomDialogWidget(
                                      name: name,
                                      price: price,
                                    ))
                          },
                          child: Text(
                            languages[51].kh,
                            style: GoogleFonts.notoSansKhmer(
                              textStyle: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            )
          ]),
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget(
      {super.key, required this.name, required this.price});

  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        languages[55].kh,
        style: GoogleFonts.notoSansKhmer(
          textStyle: TextStyle(
            color: textDarkColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
        child: Text(
          "You are subscribing to Horoscope by $name with ${NumberFormat.simpleCurrency(locale: 'en-US', decimalDigits: 2).format(price)} per day.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textDarkGreyColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: (() {
            Navigator.pop(context);
          }),
          child: Text(
            languages[56].kh,
            style: GoogleFonts.notoSansKhmer(
                textStyle: TextStyle(
              color: blueColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            )),
          ),
        ),
        CupertinoDialogAction(
          onPressed: (() {
            Navigator.pop(context);
          }),
          child: Text(
            languages[57].kh,
            style: GoogleFonts.notoSansKhmer(
                textStyle: TextStyle(
              color: blueColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            )),
          ),
        )
      ],
    );
  }
}
