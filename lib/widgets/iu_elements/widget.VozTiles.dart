import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.PlanTile.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class VozTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: TitleText('Plan de Voz', 18, Colors.blue),
      subtitle: SubtitleText(
          'Elija la oferta de minutos más conveniente para realizar llamadas nacionales durante el horario normal.',
          12),
      leading: Icon(
        Icons.mic,
        color: Colors.blue,
        size: 36,
      ),
      children: [
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '5 minutos', subtitle: '\$ 37.50 CUP', action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '10 minutos', subtitle: '\$ 72.50 CUP', action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '15 minutos', subtitle: '\$ 105.00 CUP', action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '25 minutos', subtitle: '\$ 162.50 CUP', action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '40 minutos', subtitle: '\$ 250.50 CUP', action: () {}),
      ],
    );
  }
}
