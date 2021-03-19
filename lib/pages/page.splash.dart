import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/text/widget.copyright.dart';
import 'package:ussd4noobs/widgets/text/widget.AppTitleFormat.dart';
import 'package:package_info/package_info.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Splash();
  }
}

class _Splash extends State<SplashPage> {
  String _version = "";
  @override
  void initState() {
    super.initState();
    _getVersion();
    new Future.delayed(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/home'));
  }

  Future<void> _getVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    //String buildNumber = packageInfo.buildNumber;

    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    height: 200.0,
                    image: AssetImage('assets/images/ic_logo.png'),
                  ),
                ),
                Center(
                  child: AppTitleFormat('Ussd4Noobs'),
                ),
                Center(
                  child: AppTitleFormat(_version, 20.0),
                ),
              ],
            ),
          ),
          CopyRigth()
        ],
      ),
    );
  }
}
