import 'package:flutter/material.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/iu_elements/abtstract.Saldo.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Spinner.dart';

class NacionalWidget extends SaldoWidget {
  NacionalWidget(
    MainModel model,
    String valor,
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
      right: 2,
      top: 185,
      child: GestureDetector(
        key: UniqueKey(),
        child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              border:
                  Border.all(color: Theme.of(context).canvasColor, width: 2),
              color: Theme.of(context).primaryColor,
            ),
            child: loading
                ? SpinerNoText()
                : valor == ""
                    ? Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Text(
                          ".CU",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ".CU",
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.subtitle1.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: valor,
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
                        ],
                      )),
      ),
    );
  }
}
