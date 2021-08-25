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
        Icons.sms,
        color: Colors.green,
        size: 30,
      ),
      children: [
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: '20 mensajes',
          subtitle: '\$ 15.00 CUP',
          type: 'SMS',
          plan: 20.0,
          ussdCode: "*133*2*1#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: '50 mensajes',
          subtitle: '\$ 30.00 CUP',
          type: 'SMS',
          plan: 50.0,
          ussdCode: "*133*2*2#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: '90 mensajes',
          subtitle: '\$ 50.00 CUP',
          type: 'SMS',
          plan: 90.0,
          ussdCode: "*133*2*3#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: '120 mensajes',
          subtitle: '\$ 60.00 CUP',
          type: 'SMS',
          plan: 120.0,
          ussdCode: "*133*3*1#",
          key: UniqueKey(),
        ),
      ],
    );
  }
}
