import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';
import 'package:horoscope_cellcard/wegets/selected_subscribe_card.dart';
import '../constants/colors.dart';
import '../constants/profile_lists.dart';

class SelectSubscibeList extends StatelessWidget {
  const SelectSubscibeList({Key? key, required this.route}) : super(key: key);
  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
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
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          width: double.infinity,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            shrinkWrap: false,
            children: [
              SelectedSubscribeCard(
                name: "Master Khit Samno",
                img: profiles[0],
                price: 1.5,
                contents:
                    "Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim... ",
                isSubscribed: true,
                route: this.route,
              ),
              SelectedSubscribeCard(
                name: "Master Khit Samno",
                img: profiles[1],
                price: 0.50,
                contents:
                    "Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim... ",
                isSubscribed: false,
                route: this.route,
              ),
              SelectedSubscribeCard(
                name: "Master Khit Samno",
                img: profiles[0],
                price: 2.40,
                contents:
                    "Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim... ",
                isSubscribed: false,
                route: this.route,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
