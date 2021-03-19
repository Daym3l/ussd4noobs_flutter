import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';

final ThemeData ussdTheme = _buildUssdTheme();

ThemeData _buildUssdTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: ussd_AccentColor,
      primaryColor: ussd_PrimaryColor,
      buttonTheme: base.buttonTheme.copyWith(
          buttonColor: ussd_AccentColor, textTheme: ButtonTextTheme.normal),
      scaffoldBackgroundColor: ussd_BackgroundColor,
      cardColor: ussd_SurfaceColor,
      errorColor: ussd_ErrorColor);
}
