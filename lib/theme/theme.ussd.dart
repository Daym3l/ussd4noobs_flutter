import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: isDarkTheme ? ussd_PrimaryColor : ussd_PrimaryVariant,
      scaffoldBackgroundColor:
          isDarkTheme ? ussd_PrimaryColor : ussd_PrimaryVariant,
      fontFamily: 'Poppins',
      accentColor: isDarkTheme ? ussd_AccentColorVariant : ussd_AccentColor,
      backgroundColor: isDarkTheme ? ussd_PrimaryColor : ussd_PrimaryVariant,
      indicatorColor: isDarkTheme ? ussd_AccentColorVariant : ussd_AccentColor,
      buttonColor: isDarkTheme ? ussd_AccentColorVariant : ussd_AccentColor,
      hintColor: isDarkTheme ? Colors.white54 : Colors.black54,
      hoverColor: isDarkTheme ? ussd_AccentColorVariant : ussd_AccentColor,
      focusColor: isDarkTheme ? Colors.white70 : Colors.black87,
      disabledColor: Colors.grey,
      dividerColor: isDarkTheme ? ussd_divider : ussd_dividerVariant,
      cardColor: isDarkTheme ? ussd_PrimaryColor : ussd_PrimaryVariant,
      canvasColor: isDarkTheme ? ussd_PrimaryVariant : ussd_PrimaryColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      textTheme: Theme.of(context).textTheme.copyWith(
            bodyText1: TextStyle(
                color:
                    isDarkTheme ? ussd_PrimaryTextVariant : ussd_PrimaryText),
            bodyText2: TextStyle(
                color:
                    isDarkTheme ? ussd_PrimaryText : ussd_PrimaryTextVariant),
            subtitle1: TextStyle(
                color: isDarkTheme
                    ? ussd_SecondaryTextVariant
                    : ussd_SecondaryText),
            subtitle2: TextStyle(
                color: isDarkTheme
                    ? ussd_SecondaryText
                    : ussd_SecondaryTextVariant),
            headline1: TextStyle(
                color: isDarkTheme ? ussd_PrimaryVariant : ussd_PrimaryColor),
          ),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
