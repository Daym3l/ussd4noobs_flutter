import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class PlanTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function action;

  PlanTile(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.action})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TitleText(title),
      subtitle: SubtitleText('$subtitle', 16),
      trailing: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColor.withAlpha(50),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).accentColor,
          ),
          onPressed: action,
        ),
      ),
    );
  }
}
