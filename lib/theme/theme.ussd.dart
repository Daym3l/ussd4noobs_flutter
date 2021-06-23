import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
      fontFamily: 'Poppins',
      accentColor: isDarkTheme ? Colors.white54 : Colors.black54,
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      indicatorColor: isDarkTheme ? Colors.white : Colors.black,
      buttonColor: isDarkTheme ? Colors.grey : ussd_PrimaryColor,
      hintColor: isDarkTheme ? Colors.white54 : Colors.black54,
      highlightColor: isDarkTheme ? Color(0xff372901) : ussd_AccentColor,
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : ussd_AccentColor,
      focusColor: isDarkTheme ? Colors.white70 : Colors.black87,
      disabledColor: Colors.grey,
      dividerColor: isDarkTheme ? Colors.grey[300] : Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.white : Colors.black,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      textTheme: Theme.of(context).textTheme.copyWith(
            bodyText1:
                TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
            subtitle1:
                TextStyle(color: isDarkTheme ? Colors.white70 : Colors.black87),
            headline1:
                TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
          ),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
