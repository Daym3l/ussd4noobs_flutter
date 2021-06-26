import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';

class AppTitleFormat extends StatelessWidget {
  final String title;
  final double titleSize;

  AppTitleFormat(this.title, [this.titleSize = 30]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: Text(
        title,
        style: TextStyle(
            fontSize: titleSize,
            fontFamily: 'Fressia',
            color: Theme.of(context).textTheme.bodyText1.color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
