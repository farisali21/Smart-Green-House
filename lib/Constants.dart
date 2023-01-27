import 'package:flutter/material.dart';

class Constants {
  static const double kPadding = 10.0;
  static const Color purpleLight = Color(0XFF1e224c);
  static const Color purpleDark = Color(0XFF0d193e);
  static const Color orange = Color(0XFFec8d2f);
  static const Color red = Color(0XFFf44336);



}
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);
final kLabelStyle = TextStyle(
  color: Color(0xff30825C),
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xff30825C),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);