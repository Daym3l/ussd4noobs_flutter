import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  final double texySize;

  SubtitleText(this.text, [this.texySize = 24]);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: texySize, color: Theme.of(context).accentColor),
    );
  }
}

class TileText extends StatelessWidget {
  final String text;
  final double texySize;

  TileText(this.text, [this.texySize = 24]);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: texySize,
          color: Theme.of(context).textTheme.bodyText1.color),
    );
  }
}
