import 'package:flutter/material.dart';
import 'package:ussd4noobs/pages/tab.planes.dart';
import 'package:ussd4noobs/pages/tab.saldos.dart';
import 'package:ussd4noobs/pages/tab.tranferencia.dart';
import 'package:ussd4noobs/widgets/text/widget.appBarTitle.dart';
import 'package:ussd4noobs/widgets/text/widget.AppTitleFormat.dart';

class HomePage extends StatelessWidget {
  @override
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
          actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
          bottom: TabBar(
            indicatorColor: Theme.of(context).accentColor,
            tabs: [
              Tab(
                icon: Icon(Icons.monetization_on_outlined),
                text: 'Saldos',
              ),
              Tab(
                icon: Icon(Icons.storefront),
                text: 'Planes',
              ),
              Tab(
                icon: Icon(
                  Icons.compare_arrows_sharp,
                  size: 28,
                ),
                text: 'Operaciones',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [TabSaldos(), TabPlanes(), TabTraferencia()],
        ),
      ),
    );
  }
}