import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.SaldosCard.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Spinner.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';
import 'package:ussd4noobs/widgets/text/widget.formatSaldo.dart';

class TabSaldos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormatSaldo(model.SaldoPrincipal.toString()),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SubtitleText(
                            'Línea activa hasta el ${model.VencePrincipal}', 14)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  model.getLoading
                      ? Spiner('Ejecutando código USSD...')
                      : Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).buttonColor.withAlpha(80),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.refresh_rounded,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () async {
                              bool success = await model.makeMyCall(
                                  type: 'Saldo', ussdcode: '*222#');
                              if (!success) {
                                final snackBar = SnackBar(
                                  elevation: 6.0,
                                  backgroundColor: ussd_ErrorColor,
                                  content: Text(
                                    'Error al ejecutar código MMI. Intentelo nuevamente.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          ),
                        ),
                  Divider(
                    height: 25,
                    color: Theme.of(context).dividerColor,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText('Bonificacion de:'),
                                SubtitleText(model.BonoPrincipal, 16)
                              ],
                            ))
                      ],
                    ),
                  ),
                  Divider(
                    height: 25,
                    color: Theme.of(context).dividerColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [TitleText('Planes', 20)],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    height: 200,
                    child: ListView(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SaldosCard(
                            model: model,
                            title: 'Datos',
                            valor: model.DatosPrincipal,
                            plan: model.DatosPlan,
                            vence: model.VenceDatosDias,
                            loading: model.getLoadingDatos,
                            icon: Icon(
                              Icons.wifi,
                              color: Colors.orange,
                              size: 35,
                            ),
                            prefix: model.PrefixDatos,
                            ussdcode: '*222*328#',
                            color: Colors.orange),
                        SaldosCard(
                            model: model,
                            title: 'Voz',
                            valor: model.VozPrincipal,
                            plan: model.VozPlan,
                            vence: model.VenceVozDias,
                            loading: model.getLoadingVoz,
                            icon: Icon(
                              Icons.mic,
                              color: Colors.blue,
                              size: 35,
                            ),
                            prefix: 'Min.',
                            ussdcode: '*222*869#',
                            color: Colors.blue),
                        SaldosCard(
                            model: model,
                            title: 'SMS',
                            valor: model.SmsPrincipal,
                            plan: model.SmsPlan,
                            vence: model.VenceSmsDias,
                            loading: model.getLoadingSms,
                            icon: Icon(
                              Icons.sms,
                              color: Colors.green,
                              size: 35,
                            ),
                            prefix: 'SMS',
                            ussdcode: '*222*767#',
                            color: Colors.green)
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
