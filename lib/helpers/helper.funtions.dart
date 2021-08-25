import 'package:flutter/material.dart';

class HelperFunctions {
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static double convertToGB(double value, String prefix) {
    double convert = value;
    double datos;
    switch (prefix) {
      case 'MB':
        {
          datos = convert / 1024;
        }
        break;
      case 'KB':
        {
          datos = (convert / 1024) / 1024;
        }
        break;
      default:
        {
          datos = convert;
        }
    }

    return double.parse(datos.toStringAsFixed(2));
  }
}
