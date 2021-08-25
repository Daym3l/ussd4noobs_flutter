import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.funtions.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.PlanTile.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class PlanesTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: TitleText('Plan de Datos + Min + SMS', 18, Colors.red),
      subtitle: SubtitleText(
          'Todos los planes vienen con bono de 300 MB Nacionales.', 12),
      leading: Icon(
        Icons.all_inclusive_sharp,
        color: Colors.red,
        size: 28,
      ),
      children: [
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: 'Plan Básico',
          subtitle: '125 CUP + 600MB + 800MB LTE + 15 MIN + 20 SMS',
          type: 'plan',
          plan: 0,
          ussdCode: "*133*5*1#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: 'Plan Medio',
          subtitle: '250 CUP + 1.5GB + 2GB LTE + 35 MIN + 40 SMS',
          type: 'plan',
          plan: 0,
          ussdCode: "*133*5*2#",
          key: UniqueKey(),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        PlanTile(
          title: 'Plan Extra',
          subtitle: '500 CUP + 3.5GB + 4.5GB LTE + 75 MIN + 80 SMS',
          type: 'plan',
          plan: 0,
          ussdCode: "*133*5*3#",
          key: UniqueKey(),
        ),
      ],
    );
  }
}
