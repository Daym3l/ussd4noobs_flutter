import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';
import 'package:ussd4noobs/widgets/text/widget.appBarTitle.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: AppBarTitle(),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_bag_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: SubtitleTextVariant('Comprar Planes', 18),
            onTap: () {
              Navigator.pushNamed(context, 'planes');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.local_atm_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: SubtitleTextVariant('Recargar y Transferir', 18),
            onTap: () {
              Navigator.pushNamed(context, 'operaciones');
            },
          ),
          Divider(),
          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //     color: Theme.of(context).primaryColor,
          //   ),
          //   title: SubtitleTextVariant('Configuración', 18),
          //   onTap: () {
          //     Navigator.pushNamed(context, 'settings');
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Theme.of(context).primaryColor,
            ),
            title: SubtitleTextVariant('Acerca de.', 18),
            onTap: () {
              Navigator.pushNamed(context, 'info');
            },
          ),
        ],
      ),
    );
  }
}
