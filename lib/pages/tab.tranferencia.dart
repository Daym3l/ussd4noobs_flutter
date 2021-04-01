import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TabTraferencia extends StatefulWidget {
  @override
  _TabTraferenciaState createState() => _TabTraferenciaState();
}

class _TabTraferenciaState extends State<TabTraferencia> {
  TextEditingController controllerSaldo = TextEditingController();
  TextEditingController controllerTrans = TextEditingController();
  var maskFormatterod = new MaskTextInputFormatter(
      mask: '#### - #### - #### - ####', filter: {"#": RegExp(r'[0-9]')});
  var maskFormattertelf = new MaskTextInputFormatter(
      mask: '+53 # ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    // controllerSaldo.addListener(() {
    //   print(controllerSaldo.text);
    // });
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 25),
              child: Container(
                width: 400,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300], width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    TitleText('Recargar saldo'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 16, 4, 16),
                      child: TextField(
                        autofocus: true,
                        controller: controllerSaldo,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.send,
                        inputFormatters: [maskFormatterod],
                        decoration: InputDecoration(
                            labelText: 'Introduza código de recarga',
                            hintText: '#### - #### - #### - ####',
                            contentPadding: EdgeInsets.only(left: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned.fill(
              bottom: -6.5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: -2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ussd_SecondaryColor,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controllerSaldo.text;
                        print(controllerSaldo.text);
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 25),
              child: Container(
                width: 400,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300], width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    TitleText('Transferir saldo'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 16, 4, 16),
                      child: TextField(
                        autofocus: true,
                        controller: controllerTrans,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.send,
                        inputFormatters: [maskFormattertelf],
                        decoration: InputDecoration(
                            labelText: 'Introduza número a transferir',
                            hintText: '+53 5 555 55 55',
                            contentPadding: EdgeInsets.only(left: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'Monto en MN',
                                    hintText: '25 CUP',
                                    contentPadding: EdgeInsets.only(left: 12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: TextField(
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  contentPadding: EdgeInsets.only(left: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                )),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned.fill(
              bottom: -4,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: -2.0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ussd_SecondaryColor,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.send_to_mobile,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print('Reload Saldo');
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
