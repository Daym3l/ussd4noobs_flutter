import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'USSD4NOOBS',
      style: TextStyle(
        fontFamily: 'Fressia',
      ),
      textAlign: TextAlign.center,
    );
  }
}
