import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.dart';
import 'package:ussd4noobs/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ussd4Noobs',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          backgroundColor: Helper.colorFromHex('#00796b'),
          dividerColor: Helper.colorFromHex('#7E757575'),
          accentColor: Helper.colorFromHex('#1976d2'),
          buttonColor: Helper.colorFromHex('#1976d2')),
      routes: {'/': (BuildContext context) => Splash()},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (BuildContext context) => Splash());
      },
    );
  }
}
