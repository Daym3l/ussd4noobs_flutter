import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class PlanesCard extends StatelessWidget {
  final String title;
  final double valor;
  final int vence;
  final Icon icon;
  final Color color;
  final double plan;
  final String prefix;

  PlanesCard(
      {Key key,
      @required this.title,
      @required this.valor,
      @required this.plan,
      @required this.vence,
      @required this.icon,
      @required this.prefix,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
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
                      Icons.thumb_up,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.thumb_down,
                      color: Colors.red,
                    )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 9,
            percent: vence == 0 ? 0 : (plan - valor) / plan,
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
                text: ' / ' + plan.toString() + ' $prefix',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              )
            ]),
          ),
          SubtitleText('Vence en $vence dias.', 12)
        ],
      ),
    );
  }
}
