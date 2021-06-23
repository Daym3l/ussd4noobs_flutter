import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double titleSize;
  final Color color;

  TitleText(this.title, [this.titleSize = 18, this.color = null]);
  @override
  Widget build(BuildContext context) {
    var auxColors =
        color != null ? color : Theme.of(context).textTheme.bodyText1.color;
    return Text(
      title,
      style:
          TextStyle(fontFamily: 'Bebas', fontSize: titleSize, color: auxColors),
    );
  }
}
