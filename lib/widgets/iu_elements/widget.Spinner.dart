import 'package:flutter/material.dart';

class Spiner extends StatelessWidget {
  final String _spinerText;

  Spiner(this._spinerText);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.only(top: 4.0)),
          Text(_spinerText)
        ],
      ),
    );
  }
}
