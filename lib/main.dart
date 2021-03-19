import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';
import 'package:ussd4noobs/helpers/helper.funtions.dart';
import 'package:ussd4noobs/pages/page.home.dart';
import 'package:ussd4noobs/pages/page.splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ussd4Noobs',
      initialRoute: '/',
      theme: ThemeData(
          primaryColor: ussd_PrimaryColor,
          accentColor: ussd_AccentColor,
          fontFamily: 'Poppins'),
      routes: {
        '/': (BuildContext context) => SplashPage(),
        'home': (BuildContext context) => HomePage()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
    );
  }
}
