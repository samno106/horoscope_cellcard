import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:horoscope_cellcard/constants/colors.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.img,
      required this.title,
      required this.desc,
      required this.isRead});
  final String img, title, desc;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: isRead ? const Color(0XFFFEF1D8) : Colors.white,
          border: Border.symmetric(
              horizontal: BorderSide(width: 1, color: Colors.grey.shade200))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70.0,
            height: 70.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                width: 65.0,
                height: 65.0,
                image: NetworkImage(img),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: textDarkGreyColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  desc,
                  style: TextStyle(
                      color: textDarkGreyColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    FeatherIcons.moreHorizontal,
                    size: 30.0,
                    color: canvasColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
