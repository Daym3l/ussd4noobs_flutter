import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            child: Center(
              child: TitleText('**Aún en desarrollo**'),
            ),
          ),
        ),
      ),
    );
  }
}
