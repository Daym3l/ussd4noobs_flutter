import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/domains/Saldo.dart';
import 'package:ussd_service/ussd_service.dart';

class ConectedModel extends Model {
  Saldo _saldo = Saldo(saldo: 0.0, vencimiento: '1/1/2021');
  bool _isLoaing = false;

  bool get getLoading {
    return _isLoaing;
  }

  _checkPermision_call() async {
    var phoneStatus = await Permission.phone.status;
    if (!phoneStatus.isGranted) {
      await Permission.phone.request();
    }
  }

  Future<void> makeMyCall(
      {@required int type, @required String ussdcode}) async {
    await _checkPermision_call();
    if (await Permission.phone.isGranted) {
      int subscriptionId = 1; // sim card subscription ID

      _isLoaing = true;
      notifyListeners();
      try {
        String ussdResponseMessage = await UssdService.makeRequest(
          subscriptionId,
          ussdcode,
          Duration(seconds: 15), // timeout (optional) - default is 10 seconds
        );
        print("succes! message: $ussdResponseMessage");
        switch (type) {
          case 1:
            {
              List<String> respuesta = ussdResponseMessage.split(" ");
              _saldo = Saldo(
                  saldo: double.parse(respuesta[1]), vencimiento: respuesta[6]);

              String ussdResponseMessage2 = await UssdService.makeRequest(
                subscriptionId,
                '*222*266#',
                Duration(
                    seconds: 15), // timeout (optional) - default is 10 seconds
              );
              print("succes 2! message: $ussdResponseMessage2");
            }

            break;
          default:
            {
              return;
            }
        }
      } catch (e) {
        debugPrint("error! code: ${e.code} - message: ${e.message}");
      }
      _isLoaing = false;
      notifyListeners();
    }
  }
}

class SaldosModel extends ConectedModel {
  get SaldoPrincipal {
    return _saldo.saldo;
  }

  get VencePrincipal {
    return _saldo.vencimiento;
  }
}

class BonosModel extends ConectedModel {}

class DatosModel extends ConectedModel {}

class VozModel extends ConectedModel {}

class SmsModel extends ConectedModel {}
