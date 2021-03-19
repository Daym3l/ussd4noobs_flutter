import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double titleSize;
  TitleText(this.title, [this.titleSize = 18]);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Bebas',
          fontSize: titleSize,
          color: Theme.of(context).primaryColor),
    );
  }
}
