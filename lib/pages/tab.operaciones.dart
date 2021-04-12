import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';
import 'package:ussd4noobs/models/model.main.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

var maskFormatterod = new MaskTextInputFormatter(
    mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
var maskFormattertelf = new MaskTextInputFormatter(
    mask: '53 # ### ## ##', filter: {"#": RegExp(r'[0-9]')});

class TabTraferencia extends StatefulWidget {
  @override
  _TabTraferenciaState createState() => _TabTraferenciaState();
}

class _TabTraferenciaState extends State<TabTraferencia> {
  TextEditingController controllerSaldo = TextEditingController();
  TextEditingController controllerNum = TextEditingController();
  TextEditingController controllerMonto = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  final GlobalKey<FormState> _formKeyRecarga = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyTrans = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        child: Form(
                            key: _formKeyRecarga,
                            child: TextFormField(
                              controller: controllerSaldo,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.send,
                              inputFormatters: [maskFormatterod],
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Código Requerido.';
                                }
                                if (value.length < 17) {
                                  return 'Código inorrecto. Deben ser 16 números.';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Introduza código de recarga',
                                  hintText: '#### #### #### ####',
                                  suffix: IconButton(
                                    icon: Icon(
                                      Icons.qr_code_scanner_rounded,
                                      color: ussd_AccentColor,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      showBottomSheet(
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return Container(
                                              height: 400,
                                              child: Column(
                                                children: <Widget>[
                                                  Expanded(
                                                      flex: 5,
                                                      child: _buildQrView(bc)),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                      child: SubtitleText(
                                                          'Escanear a código.'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 12, bottom: 5),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            )),
                      ),
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
                      child: ScopedModelDescendant(builder:
                          (BuildContext context, Widget child,
                              MainModel model) {
                        return IconButton(
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _recargar(model);
                          },
                        );
                      }),
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
                  child: Form(
                      key: _formKeyTrans,
                      child: Column(
                        children: [
                          TitleText('Transferir saldo'),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4, 16, 4, 16),
                            child: TextFormField(
                              controller: controllerNum,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.send,
                              inputFormatters: [maskFormattertelf],
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Número de telf. Requerido.';
                                }
                                if (value.length < 14) {
                                  return 'Número de telf. incorrecto.';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Introduza número a transferir',
                                hintText: '53 5 555 55 55',
                                contentPadding: EdgeInsets.only(left: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
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
                                    child: TextFormField(
                                      controller: controllerMonto,
                                      keyboardType: TextInputType.number,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Campo obligatorio.';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Monto en MN',
                                          hintText: '25 CUP',
                                          contentPadding:
                                              EdgeInsets.only(left: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: TextFormField(
                                      controller: controllerPass,
                                      keyboardType: TextInputType.number,
                                      obscureText: true,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Campo obligatorio.';
                                        }
                                        if (value.length < 4) {
                                          return 'La longitud de la contraseña no debe ser menor que 4.';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Contraseña',
                                        suffix: ScopedModelDescendant(builder:
                                            (BuildContext context, Widget child,
                                                MainModel model) {
                                          return IconButton(
                                              icon: Icon(
                                                Icons.vpn_key_outlined,
                                                color: ussd_AccentColor,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                model.exeCallUssd(
                                                    ussdcode: "*234*2#");
                                              });
                                        }),
                                        contentPadding:
                                            EdgeInsets.only(left: 12),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                ))
                              ],
                            ),
                          )
                        ],
                      )),
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
                      child: ScopedModelDescendant(builder:
                          (BuildContext context, Widget child,
                              MainModel model) {
                        return IconButton(
                          icon: Icon(
                            Icons.compare_arrows_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _transferir(model);
                          },
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: (QRViewController controller) {
        setState(() {
          this.controller = controller;
        });

        controller.scannedDataStream.listen((scanData) {
          setState(() {
            result = scanData;
          });
          controller.pauseCamera();
          _updateValueWithQr();
          Navigator.pop(context);
        });
      },
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  _updateValueWithQr() {
    String aux = result.code;
    List<String> auxList = aux.split("");
    String value = "";
    for (var i = 0; i < auxList.length; i++) {
      if (i == 4 || i == 8 || i == 12) {
        value += ' ';
      }
      value += auxList[i];
    }
    controllerSaldo.text = value;
  }

  _recargar(MainModel model) {
    if (_formKeyRecarga.currentState.validate()) {
      List<String> splitCodigo = controllerSaldo.text.split(' - ');
      String cod = splitCodigo.join();
      controllerSaldo.clear();
      model.exeCallUssd(ussdcode: "*662*$cod#");
    }
  }

  _transferir(MainModel model) {
    if (_formKeyTrans.currentState.validate()) {
      String _monto = controllerMonto.text;
      String _pass = controllerPass.text;
      List<String> _auxNum = controllerNum.text.split(" ");
      String _num = _auxNum.join("");
      model.exeCallUssd(ussdcode: "*234*1*$_num*$_pass*$_monto#");
      controllerMonto.clear();
      controllerNum.clear();
      controllerPass.clear();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
