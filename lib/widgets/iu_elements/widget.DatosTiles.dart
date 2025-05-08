import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.funtions.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.PlanTile.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class DatosTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: TitleText('Plan de Datos', 18, Theme.of(context).accentColor),
      subtitle: SubtitleText(
          'Comprar un paquete que datos provee a sus dispositivo movil de conectividad a Internet.',
          12),
      leading: Icon(
        Icons.wifi,
        color: Theme.of(context).accentColor,
        size: 35,
      ),
      children: [
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: 'Tarifa por Consumo',
          subtitle: 'Consumo directo desde el saldo 1 MB = 25 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB(1, 'MB'),
          ussdCode: "*133*1*1#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: 'Bolsa Correo',
          subtitle: '600 MB / \$ 25.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB(600, 'MB'),
          ussdCode: "*133*1*2#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: 'Bolsa Diaria LTE',
          subtitle: '200 MB / \$ 25.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB(200, 'MB'),
          ussdCode: "*133*1*3#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: '1 GB LTE',
          subtitle: '1 GB / \$ 100.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB(1, 'GB'),
          ussdCode: "*133*1*4*1#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: '2.5 GB LTE',
          subtitle: '2.5 GB / \$ 200.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB(2.5, 'GB'),
          ussdCode: "*133*1*4*2#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: '16 GB LTE (4GB + 12GB Solo LTE)',
          subtitle: '16 GB / \$ 950.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB(16, 'GB'),
          ussdCode: "*133*1*4*3#",
          key: UniqueKey(),
        ),
      ],
    );
  }
}
