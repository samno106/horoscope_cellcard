import 'package:flutter/material.dart';

class HoroscopePage extends StatefulWidget {
  HoroscopePage({Key? key}) : super(key: key);

  @override
  State<HoroscopePage> createState() => _HoroscopePageState();
}

class _HoroscopePageState extends State<HoroscopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Horoscope Page"),
      ),
    );
  }
}
