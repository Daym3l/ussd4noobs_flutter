import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';
import 'package:ussd4noobs/models/model.main.dart';

abstract class SaldoWidget extends StatelessWidget {
  final dynamic valor;
  final int vence;
  final bool loading;
  final double plan;
  final String prefix;
  final MainModel model;

  SaldoWidget({
    Key key,
    @required this.model,
    @required this.valor,
    @required this.plan,
    @required this.vence,
    @required this.loading,
    @required this.prefix,
  }) : super(key: key);

  Color getTextColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2.color;
  }

  Color getSubColor(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2.color;
  }

  Future refresh(BuildContext context, String name, String code) async {
    {
      bool success = await model.makeMyCall(type: name, ussdcode: code);
      if (!success) {
        final snackBar = SnackBar(
          elevation: 6.0,
          backgroundColor: ussd_ErrorColor,
          content: Text(
            'Error al ejecutar código MMI. Intentelo nuevamente.',
            style: TextStyle(color: ussd_ErrorTextColor),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
