import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class PlanTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String type;
  final String ussdCode;
  final double plan;

  PlanTile(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.type,
      @required this.ussdCode,
      @required this.plan})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      title: TitleText(title),
      subtitle: SubtitleText('$subtitle', 16),
      trailing: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColor.withAlpha(50),
        ),
        child: ScopedModelDescendant(
            builder: (BuildContext context, Widget child, MainModel model) {
          return IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              model.exeCallUssd(ussdcode: ussdCode);
            },
          );
        }),
      ),
    );
  }
}
