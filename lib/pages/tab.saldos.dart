import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/iu_elements/widget.SaldosCard.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';
import 'package:ussd4noobs/widgets/text/widget.formatSaldo.dart';

class TabSaldos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 20, 25, 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormatSaldo('1960.09'),
              Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [SubtitleText('Su saldo vence el 25/12/2021.', 14)],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).primaryColor.withAlpha(50),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    print('Reload Saldo');
                  },
                ),
              ),
              Divider(
                height: 25,
                color: Colors.grey[300],
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
                            SubtitleText('Datos.cu 289 MB vence: 02/04/21.', 14)
                          ],
                        ))
                  ],
                ),
              ),
              Divider(
                height: 25,
                color: Colors.grey[300],
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
                        title: 'Datos',
                        valor: 1.6,
                        plan: 14,
                        vence: 28,
                        icon: Icon(
                          Icons.network_wifi,
                          color: Colors.orange,
                          size: 35,
                        ),
                        prefix: 'GB',
                        color: Colors.orange),
                    SaldosCard(
                        title: 'Voz',
                        valor: 0,
                        plan: 0,
                        vence: 0,
                        icon: Icon(
                          Icons.mic,
                          color: Colors.blue,
                          size: 35,
                        ),
                        prefix: 'Min.',
                        color: Colors.blue),
                    SaldosCard(
                        title: 'SMS',
                        valor: 8,
                        plan: 10,
                        vence: 5,
                        icon: Icon(
                          Icons.message,
                          color: Colors.green,
                          size: 35,
                        ),
                        prefix: 'SMS',
                        color: Colors.green)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
