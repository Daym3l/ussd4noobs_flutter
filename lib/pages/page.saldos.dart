import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Datos.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Nacional.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Sms.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Spinner.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.Voz.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';
import 'package:ussd4noobs/widgets/text/widget.formatSaldo.dart';

class SaldosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new GestureDetector(
                    onTap: () async {
                      await _getSaldo(model, context);
                    },
                    child: Column(
                      children: [
                        TitleText("Saldo Principal"),
                        model.getLoading
                            ? Spiner('Ejecutando código USSD...')
                            : FormatSaldo(model.SaldoPrincipal.toString()),
                        Container(
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              SubtitleText(
                                  'Vence el ${model.VencePrincipal}.', 14)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 15)),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 250,
                        ),
                        DatosWidget(
                          model,
                          model.DatosPrincipal,
                          model.DatosPlan,
                          model.VenceDatosDias,
                          model.getLoadingDatos,
                          model.PrefixDatos,
                        ),
                        VozWidget(model, model.VozPrincipal, model.VozPlan,
                            model.VenceVozDias, model.getLoadingVoz, 'Min.'),
                        SmsWidget(model, model.SmsPrincipal, model.SmsPlan,
                            model.VenceSmsDias, model.getLoadingSms, 'SMS'),
                        NacionalWidget(
                            model,
                            model.BonoPrincipal,
                            model.SmsPlan,
                            model.VenceSmsDias,
                            model.getLoadingSms,
                            'MB')
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

  Future _getSaldo(MainModel model, BuildContext context) async {
    bool success = await model.makeMyCall(type: 'Saldo', ussdcode: '*222#');
    if (!success) {
      final snackBar = SnackBar(
        elevation: 6.0,
        backgroundColor: ussd_ErrorColor,
        content: Text(
          'Error al ejecutar código MMI. Intentelo nuevamente.',
          style: TextStyle(color: Colors.white),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
