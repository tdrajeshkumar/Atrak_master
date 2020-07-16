import 'package:flutter/material.dart';

class AtrakTheme {
  static Color gradientStartColor = Color(0xFF36D1DC);
  static Color gradientEndColor = Color(0xFF2948FF);
  static Color backgroundColor = Color(0xFFEEF0F2);
  static Color iconColor = Colors.white;
  static Color textIndicatorColor = Color(0xFF19BCF4);
  static Color checkInButtonColor = Color(0xFF39B54A);
  static Color checkOutButtonColor = Color(0xFFF7931E);
  static Color slideTextColor = Color(0xFFAFAFAF);
  static Color dividerColor = Color(0xFFD5D5D5);
  static Color darkDisplayColor = Color(0xFF4D4D4D);
  static Color greyTextColor = Color(0xFF999999);
  static Color checkInBackgroundColor = Color(0xFFF2F2F2);
  static Color backArrowColor = Color(0xFF35c4e0);
  static Color attendanceBackgroundColor = Color(0xFFEEF0F2);



  /// Attendace Marker Color
  static Color leaveColor = Color(0xFFF15A24);
  static Color holidayColor = Color(0xFF00DF93);


  static get theme {

    final originalTextTheme = ThemeData.light().textTheme;
    final originalBody1 = originalTextTheme.body1;
    final originalBody2 = originalTextTheme.body2;

    return ThemeData.light().copyWith(
      primaryColor: gradientStartColor,
        backgroundColor: backgroundColor,
        textTheme: originalTextTheme.copyWith(
          display1: TextStyle(
              fontFamily: 'WorkSanks',
              fontStyle: FontStyle.normal,
              color: darkDisplayColor),
          display2: TextStyle(
              fontFamily: 'WorkSanks',
              fontWeight: FontWeight.w200,
              color: darkDisplayColor),
          display3: TextStyle(
              fontFamily: 'WorkSanks',
              fontWeight: FontWeight.w600,
              color: darkDisplayColor),
        ));
  }
}
