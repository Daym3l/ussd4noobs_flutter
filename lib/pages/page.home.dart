import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ussd4noobs/pages/tab.planes.dart';
import 'package:ussd4noobs/pages/tab.saldos.dart';
import 'package:ussd4noobs/pages/tab.operaciones.dart';
import 'package:ussd4noobs/widgets/text/widget.appBarTitle.dart';

class HomePage extends StatelessWidget {
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
                  icon: FaIcon(FontAwesomeIcons.ellipsisV), onPressed: () {})
            ],
            bottom: TabBar(
              indicatorColor: Theme.of(context).accentColor,
              tabs: [
                Tab(
                  icon: FaIcon(FontAwesomeIcons.handHoldingUsd),
                  text: 'Saldos',
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.store),
                  text: 'Planes',
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.coins),
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
