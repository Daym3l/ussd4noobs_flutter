import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      leading: FaIcon(
        FontAwesomeIcons.sms,
        color: Colors.green,
        size: 30,
      ),
      children: [
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '10 mensajes',
          subtitle: '\$ 17.50 CUP',
          type: 'SMS',
          plan: 10.0,
          ussdCode: "*133*2*1#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '20 mensajes',
          subtitle: '\$ 32.50 CUP',
          type: 'SMS',
          plan: 20.0,
          ussdCode: "*133*2*2#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '15 mensajes',
          subtitle: '\$ 52.50 CUP',
          type: 'SMS',
          plan: 15.0,
          ussdCode: "*133*2*3#",
          key: UniqueKey(),
        ),
        Divider(
          color: Colors.grey[300],
        ),
        PlanTile(
          title: '25 mensajes',
          subtitle: '\$ 62.50 CUP',
          type: 'SMS',
          plan: 25.0,
          ussdCode: "*133*3*1#",
          key: UniqueKey(),
        ),
      ],
    );
  }
}
