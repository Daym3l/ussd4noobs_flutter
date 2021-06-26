import 'package:flutter/material.dart';
import 'package:ussd4noobs/pages/tab.planes.dart';
import 'package:ussd4noobs/pages/page.saldos.dart';
import 'package:ussd4noobs/pages/tab.operaciones.dart';
import 'package:ussd4noobs/theme/theme.provider.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Menu.dart';
import 'package:ussd4noobs/widgets/text/widget.appBarTitle.dart';

class HomePage extends StatelessWidget {
  final ThemeProvider themeProvider;

  HomePage(this.themeProvider);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 10,
            centerTitle: true,
            title: AppBarTitle(),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: IconButton(
                    icon: Icon(themeProvider.darkTheme
                        ? Icons.bedtime_rounded
                        : Icons.wb_sunny_rounded),
                    onPressed: () {
                      themeProvider.darkTheme = !themeProvider.darkTheme;
                    }),
              )
            ],
          ),
          body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SaldosPage(),
          )),
    );
  }
}
