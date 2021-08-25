import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.DatosTiles.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Planes.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.SmsTiles.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.VozTiles.dart';

class TabPlanes extends StatefulWidget {
  @override
  _TabPlanesState createState() => _TabPlanesState();
}

class _TabPlanesState extends State<TabPlanes> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
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
    );
  }
}
