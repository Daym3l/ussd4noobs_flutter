import 'package:flutter/material.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/iu_elements/abtstract.Saldo.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Spinner.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class SmsWidget extends SaldoWidget {
  SmsWidget(
    MainModel model,
    dynamic valor,
    double plan,
    int vence,
    bool loading,
    String prefix,
  ) : super(
            loading: loading,
            model: model,
            plan: plan,
            prefix: prefix,
            valor: valor,
            vence: vence);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 8 - 8,
      top: 235,
      child: GestureDetector(
        key: UniqueKey(),
        onTap: () => refresh(context, "SMS", "*222*767#"),
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              border:
                  Border.all(color: Theme.of(context).canvasColor, width: 2),
              color: Theme.of(context).primaryColor,
            ),
            child: loading
                ? SpinerNoText()
                : vence == 0
                    ? Icon(
                        Icons.sms,
                        color: Theme.of(context).canvasColor,
                        size: 30,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sms,
                            color: Theme.of(context).canvasColor,
                            size: 20,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: valor.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color),
                              ),
                              TextSpan(
                                text: ' $prefix',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ]),
                          ),
                          SubtitleText(vence.toString() + " Días", 12),
                        ],
                      )),
      ),
    );
  }
}
