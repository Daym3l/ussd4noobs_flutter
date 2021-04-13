import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: isDarkTheme ? Colors.black : ussd_PrimaryColor,
      fontFamily: 'Poppins',
      accentColor: isDarkTheme ? Colors.white54 : ussd_AccentColor,
      backgroundColor: isDarkTheme ? Colors.black : ussd_BackgroundColor,
      indicatorColor: isDarkTheme ? Colors.white : ussd_AccentColor,
      buttonColor: isDarkTheme ? Colors.grey : ussd_PrimaryColor,
      hintColor: isDarkTheme ? Colors.white54 : ussd_PrimarySubText,
      highlightColor: isDarkTheme ? Color(0xff372901) : ussd_AccentColor,
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : ussd_AccentColor,
      focusColor: isDarkTheme ? Colors.white70 : Color(0xFF151515),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      textTheme: Theme.of(context)
          .textTheme
          .copyWith(bodyText1: TextStyle(color: ussd_PrimaryColor)),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
