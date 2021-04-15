import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Spinner.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class SaldosCard extends StatelessWidget {
  final String title;
  final dynamic valor;
  final int vence;
  final Icon icon;
  final bool loading;
  final Color color;
  final double plan;
  final String prefix;
  final String ussdcode;
  final MainModel model;

  SaldosCard(
      {Key key,
      @required this.model,
      @required this.title,
      @required this.valor,
      @required this.plan,
      @required this.vence,
      @required this.loading,
      @required this.icon,
      @required this.prefix,
      @required this.ussdcode,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: UniqueKey(),
      onTap: () async {
        bool success = await model.makeMyCall(type: title, ussdcode: ussdcode);
        if (!success) {
          final snackBar = SnackBar(
            elevation: 6.0,
            backgroundColor: ussd_ErrorColor,
            content:
                Text('Error al ejecutar código MMI. Intentelo nuevamente.'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Colors.grey[300], width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).accentColor.withAlpha(100),
                      fontSize: 14),
                ),
                vence > 0
                    ? Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.thumb_down_alt_outlined,
                        color: Colors.red,
                      )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            loading
                ? Spiner('')
                : CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 9,
                    percent: vence == 0 ? 0 : (30 - vence) / 30,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: icon,
                    progressColor: color,
                  ),
            Padding(padding: EdgeInsets.only(top: 15)),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: valor.toString(),
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).accentColor),
                ),
                TextSpan(
                  text: ' $prefix',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ]),
            ),
            SubtitleText('Vence en $vence días.', 14)
          ],
        ),
      ),
    );
  }
}
