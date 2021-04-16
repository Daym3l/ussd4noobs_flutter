import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (int option) {
        switch (option) {
          case 1:
            {
              Navigator.pushNamed(context, "settings");
            }
            break;

          default:
            {
              Navigator.pushNamed(context, "info");
            }
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: TileText("Ajustes", 15),
        ),
        PopupMenuItem(
          value: 2,
          child: TileText("Acerca de.", 15),
        ),
      ],
    );
  }
}
