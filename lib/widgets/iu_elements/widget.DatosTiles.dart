import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.funtions.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.PlanTile.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class DatosTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: TitleText('Plan de Datos', 18, Colors.orange),
      subtitle: SubtitleText(
          'Comprar un paquete que datos provee a sus dispositivo movil de conectividad a Internet.',
          12),
      leading: Icon(
        Icons.network_wifi,
        color: Colors.orange,
        size: 36,
      ),
      children: [
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: 'Tarifa por Consumo',
          subtitle: 'Consumo directo desde el saldo 1 MB = 25 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('1', 'MB'),
          ussdCode: "*133*1*1#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: 'Bolsa Correo',
          subtitle: '50 MB / \$ 25.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('50', 'MB'),
          ussdCode: "*133*1*2#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: 'Bolsa Diaria LTE',
          subtitle: '200 MB / \$ 25.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('200', 'MB'),
          ussdCode: "*133*1*3#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '400 MB + 500 MB de Bono LTE',
          subtitle: '900 MB / \$ 125.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('900', 'MB'),
          ussdCode: "*133*1*4*1#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '600 MB + 800 MB de Bono LTE',
          subtitle: '1.3 GB / \$ 175.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('1.3', 'GB'),
          ussdCode: "*133*1*4*2#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '1 GB + 1.5 GB de Bono LTE',
          subtitle: '2.5 GB / \$ 250.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('2.5', 'GB'),
          ussdCode: "*133*1*4*3#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '2.5 GB + 3 GB de Bono LTE',
          subtitle: '5.5 GB / \$ 500.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('5.5', 'GB'),
          ussdCode: "*133*1*4*4#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '4 GB + 5 GB de Bono LTE',
          subtitle: '9 GB / \$ 750.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('9', 'GB'),
          ussdCode: "*133*1*4*5#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '1 GB LTE',
          subtitle: '1 GB / \$ 100.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('1', 'GB'),
          ussdCode: "*133*1*5*1#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '2.5 GB LTE',
          subtitle: '2.5 GB / \$ 200.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('2.5', 'GB'),
          ussdCode: "*133*1*5*2#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '14 GB LTE (4GB + 10GB Solo LTE)',
          subtitle: '14 GB / \$ 1125.00 CUP',
          type: 'Datos',
          plan: HelperFunctions.convertToGB('14', 'GB'),
          ussdCode: "*133*1*5*3#",
          key: UniqueKey(),
        ),
      ],
    );
  }
}
