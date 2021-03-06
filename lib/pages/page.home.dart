import 'package:flutter/material.dart';
import 'package:ussd4noobs/pages/tab.planes.dart';
import 'package:ussd4noobs/pages/tab.saldos.dart';
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
              IconButton(
                  icon: Icon(themeProvider.darkTheme
                      ? Icons.bedtime_rounded
                      : Icons.wb_sunny_rounded),
                  onPressed: () {
                    themeProvider.darkTheme = !themeProvider.darkTheme;
                  }),
              Menu()
            ],
            bottom: TabBar(
              indicatorColor: Theme.of(context).accentColor,
              tabs: [
                Tab(
                  icon: Icon(Icons.monetization_on_outlined),
                  text: 'Saldos',
                ),
                Tab(
                  icon: Icon(Icons.storefront_rounded),
                  text: 'Planes',
                ),
                Tab(
                  icon: Icon(Icons.device_hub_sharp),
                  text: 'Operaciones',
                )
              ],
            ),
          ),
          body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: TabBarView(
              children: [TabSaldos(), TabPlanes(), TabTraferencia()],
            ),
          )),
    );
  }
}
