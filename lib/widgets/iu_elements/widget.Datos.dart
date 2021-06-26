import 'package:flutter/material.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/iu_elements/abtstract.Saldo.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Spinner.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class DatosWidget extends SaldoWidget {
  DatosWidget(
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
      child: GestureDetector(
        key: UniqueKey(),
        onTap: () => refresh(context, 'Datos', "*222*328#"),
        child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: Theme.of(context).canvasColor,
            ),
            child: loading
                ? SpinerNoText()
                : vence == 0
                    ? Icon(
                        Icons.wifi,
                        color: Theme.of(context).primaryColor,
                        size: 60,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wifi,
                            color: Theme.of(context).primaryColor,
                            size: 36,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: valor.toString(),
                                style: TextStyle(
                                    fontSize: 28, color: getTextColor(context)),
                              ),
                              TextSpan(
                                text: ' $prefix',
                                style: TextStyle(
                                    color: getSubColor(context),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              )
                            ]),
                          ),
                          SubtitleTextVariant(vence.toString() + " Días", 20),
                        ],
                      )),
      ),
    );
  }
}
