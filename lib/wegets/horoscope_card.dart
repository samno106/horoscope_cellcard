import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/constants/colors.dart';
import 'package:horoscope_cellcard/wegets/select_subscibe_list.dart';

class HoroscopeCard extends StatelessWidget {
  const HoroscopeCard(
      {Key? key, required this.img, required this.name, required this.route})
      : super(key: key);

  final String img, name, route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        // onTap: () => {Get.toNamed(route)},
        onTap: () => {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  builder: ((context) {
                    return SelectSubscibeList();
                  })),
            },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(5.0),
          height: 135.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: textBlackColor, spreadRadius: 2, blurRadius: 5),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                fit: BoxFit.contain,
                image: AssetImage(img),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: textDarkColor,
                ),
              )
            ],
          ),
        ));
  }
}
