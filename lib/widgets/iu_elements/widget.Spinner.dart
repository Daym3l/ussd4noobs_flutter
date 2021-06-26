import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Spiner extends StatelessWidget {
  final String _spinerText;

  Spiner([this._spinerText = ""]);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            radius: 30,
          ),
          Padding(padding: EdgeInsets.only(top: 4.0)),
          Text(
            _spinerText,
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
          )
        ],
      ),
    );
  }
}

class SpinerNoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            radius: 30,
          ),
        ],
      ),
    );
  }
}
