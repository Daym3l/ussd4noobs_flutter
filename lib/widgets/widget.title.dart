import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.dart';

class FormatTitle extends StatelessWidget {
  final String title;
  final double titleSize;

  FormatTitle(this.title, [this.titleSize = 30]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: Text(
        title,
        style: TextStyle(
            fontSize: titleSize,
            fontFamily: 'Fressia',
            color: Helper.colorFromHex('#212121')),
        textAlign: TextAlign.center,
      ),
    );
  }
}
