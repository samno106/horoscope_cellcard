import 'package:flutter/material.dart';

class HoroscopeCard extends StatelessWidget {
  const HoroscopeCard({Key? key, required this.img, required this.name})
      : super(key: key);

  final String img, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(5.0),
      height: 135.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(img),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Color(0XFF2C3E50),
            ),
          )
        ],
      ),
    );
  }
}
