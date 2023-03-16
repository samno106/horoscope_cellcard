import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';
import 'package:horoscope_cellcard/wegets/subscibe_card.dart';

import '../constants/colors.dart';

class SelectSubscibeList extends StatelessWidget {
  const SelectSubscibeList({Key? key}) : super(key: key);

  get profiles => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(children: [
        Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 30.0),
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pop(), // Closing the sheet.
                  child: Icon(
                    FeatherIcons.x,
                    size: 18.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  languages[49].kh,
                  style: GoogleFonts.notoSerifKhmer(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                )
              ],
            )
          ]),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 300.0,
          width: double.infinity,
          child: ListView(
            padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
            shrinkWrap: false,
            children: [],
          ),
        )
      ]),
    );
  }
}
