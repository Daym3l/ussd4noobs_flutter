import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.funtions.dart';

class CopyRigth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(
        "Copyright © 2021 daym3l",
        style: TextStyle(
            fontSize: 14,
            fontFamily: 'Fressia',
            color: HelperFunctions.colorFromHex('#212121')),
        textAlign: TextAlign.center,
      ),
    );
  }
}
