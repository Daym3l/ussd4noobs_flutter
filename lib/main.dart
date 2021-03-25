import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/pages/page.home.dart';
import 'package:ussd4noobs/pages/page.splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  final MainModel _mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _mainModel,
      child: MaterialApp(
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
          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage());
        },
      ),
    );
  }
}
