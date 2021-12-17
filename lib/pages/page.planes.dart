import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.DatosTiles.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Planes.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.SmsTiles.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.VozTiles.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class PlanesPage extends StatefulWidget {
  @override
  _PlanesPageState createState() => _PlanesPageState();
}

class _PlanesPageState extends State<PlanesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Planes, bolsas y paquetes'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Icon(
                    Icons.shopping_bag,
                    color: Theme.of(context).accentColor,
                    size: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: SubtitleText(
                        "Todos los Planes de Datos vienen con un bono de 300 MB para Navegación Nacional.",
                        14),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  DatosTiles(),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  VozTiles(),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  SmsTiles(),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  PlanesTiles()
                ],
              ),
            ),
          ),
        ));
  }
}
