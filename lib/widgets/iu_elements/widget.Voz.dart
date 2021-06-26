import 'package:flutter/material.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/iu_elements/abtstract.Saldo.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Spinner.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class VozWidget extends SaldoWidget {
  VozWidget(
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
      right: 45,
      top: 245,
      child: GestureDetector(
        key: UniqueKey(),
        onTap: () => refresh(context, "Voz", "*222*869#"),
        child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: Theme.of(context).canvasColor,
            ),
            child: loading
                ? SpinerNoText()
                : vence == 0
                    ? Icon(
                        Icons.mic,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mic,
                            color: Theme.of(context).primaryColor,
                            size: 26,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: valor.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: getTextColor(context)),
                              ),
                              TextSpan(
                                text: ' $prefix',
                                style: TextStyle(
                                    color: getSubColor(context),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ]),
                          ),
                          SubtitleTextVariant(vence.toString() + " Días", 14),
                        ],
                      )),
      ),
    );
  }
}
