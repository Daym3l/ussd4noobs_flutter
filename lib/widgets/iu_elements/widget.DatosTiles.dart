import 'package:flutter/material.dart';
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
            title: 'Bolsa Correo',
            subtitle: '50 MB / \$ 25.00 CUP',
            action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: 'Bolsa Diaria LTE',
            subtitle: '200 MB / \$ 25.00 CUP',
            action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: '400 MB + 500 MB de Bono LTE',
            subtitle: '900 MB / \$ 125.00 CUP',
            action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: '600 MB + 800 MB de Bono LTE',
            subtitle: '1.3 GB / \$ 175.00 CUP',
            action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: '1 GB + 1.5 GB de Bono LTE',
            subtitle: '2.5 GB / \$ 250.00 CUP',
            action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: '2.5 GB + 3 GB de Bono LTE',
            subtitle: '5.5 GB / \$ 500.00 CUP',
            action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: '4 GB + 5 GB de Bono LTE',
            subtitle: '9 GB / \$ 750.00 CUP',
            action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: '1 GB LTE', subtitle: '1 GB / \$ 100.00 CUP', action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: '2.5 GB LTE',
            subtitle: '2.5 GB / \$ 200.00 CUP',
            action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
            title: '14 GB LTE (4GB + 10GB Solo LTE)',
            subtitle: '14 GB / \$ 1125.00 CUP',
            action: () {}),
      ],
    );
  }
}
