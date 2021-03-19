import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.PlanTile.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class SmsTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: TitleText('Plan de Sms', 18, Colors.green),
      subtitle: SubtitleText(
          'Si prefiere usar los mensajes (SMS) para comunicarse, elija uno de los planes disponibles.',
          12),
      leading: Icon(
        Icons.message,
        color: Colors.green,
        size: 36,
      ),
      children: [
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '10 mensajes', subtitle: '\$ 17.50 CUP', action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '20 mensajes', subtitle: '\$ 32.50 CUP', action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '15 mensajes', subtitle: '\$ 52.50 CUP', action: () {}),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(title: '25 mensajes', subtitle: '\$ 62.50 CUP', action: () {}),
      ],
    );
  }
}
