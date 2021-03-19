import 'package:flutter/material.dart';
import '../../helpers/helper.colors.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double titleSize;
  final Color color;

  TitleText(this.title, [this.titleSize = 18, this.color = ussd_PrimaryColor]);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontFamily: 'Bebas', fontSize: titleSize, color: color),
    );
  }
}
