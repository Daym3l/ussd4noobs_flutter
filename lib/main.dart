import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/pages/page.home.dart';
import 'package:ussd4noobs/pages/page.info.dart';
import 'package:ussd4noobs/pages/page.settings.dart';
import 'package:ussd4noobs/pages/page.splash.dart';
import 'package:ussd4noobs/theme/theme.provider.dart';
import 'package:ussd4noobs/theme/theme.ussd.dart';

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
  ThemeProvider themeProvider = new ThemeProvider();

  @override
  void initState() {
    _mainModel.getSaldo();
    _mainModel.getBono();
    _mainModel.getDatos();
    _mainModel.getVoz();
    _mainModel.getSms();
    getCurrentAppTheme();

    super.initState();
  }

  void getCurrentAppTheme() async {
    themeProvider.darkTheme = await themeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeProvider;
      },
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return ScopedModel(
            model: _mainModel,
            child: MaterialApp(
              title: 'Ussd4Noobs',
              initialRoute: '/',
              theme: Styles.themeData(themeProvider.darkTheme, context),
              routes: {
                '/': (BuildContext context) => SplashPage(),
                'home': (BuildContext context) => HomePage(themeProvider),
                'info': (BuildContext context) => InfoPage(),
                'settings': (BuildContext context) => SettingsPage(),
              },
              onUnknownRoute: (settings) {
                return MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(themeProvider));
              },
            ),
          );
        },
      ),
    );
  }
}
