import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/domains/Bono.dart';
import 'package:ussd4noobs/domains/Saldo.dart';
import 'package:ussd4noobs/helpers/helper.sharedPref.dart';
import 'package:ussd_service/ussd_service.dart';

class ConectedModel extends Model {
  Saldo _saldo = Saldo(saldo: 0.0, vencimiento: '1/1/2021');
  Bono _bono = Bono(valor: " ");

  bool _isLoaing = false;
  SharedPref _pref = SharedPref();

  bool get getLoading {
    return _isLoaing;
  }

  _checkPermision_call() async {
    var phoneStatus = await Permission.phone.status;
    if (!phoneStatus.isGranted) {
      await Permission.phone.request();
    }
  }

  Future<bool> makeMyCall(
      {@required int type, @required String ussdcode}) async {
    await _checkPermision_call();
    bool success = true;
    if (await Permission.phone.isGranted) {
      int subscriptionId = 1; // sim card subscription ID
      _isLoaing = true;
      notifyListeners();

      try {
        String ussdResponseMessage = await UssdService.makeRequest(
          subscriptionId,
          ussdcode,
          Duration(seconds: 15),
        );
        print("Saldo: $ussdResponseMessage");

        switch (type) {
          case 1:
            {
              List<String> res = ussdResponseMessage.split(" ");
              _saldo = Saldo(saldo: double.parse(res[1]), vencimiento: res[6]);
              _pref.save("saldo", _saldo);

              String ussdResponseMessage2 = await UssdService.makeRequest(
                subscriptionId,
                '*222*266#',
                Duration(seconds: 15),
              );
              print("Bono: $ussdResponseMessage2");

              List<String> resBono = ussdResponseMessage2.split('Bono->vence:');
              if (resBono.length > 0) {
                String bono = resBono[1].replaceAll('->', ' vence: ');
                bono = bono.replaceFirst(' ', '');
                _bono = Bono(valor: bono);
                _pref.save('bono', _bono);
              }
            }
            break;
          default:
            {
              success = false;
            }
        }
      } catch (e) {
        debugPrint("error! code: ${e.code} - message: ${e.message}");
        _isLoaing = false;
        success = false;
      }
    }
    _isLoaing = false;
    notifyListeners();
    return success;
  }
}

class SaldosModel extends ConectedModel {
  get SaldoPrincipal {
    return _saldo.saldo;
  }

  get VencePrincipal {
    return _saldo.vencimiento;
  }

  getSaldo() async {
    try {
      _saldo = Saldo.fromJson(await _pref.read("saldo"));
      notifyListeners();
    } catch (Excepetion) {
      debugPrint("error on Pref Saldo! ");
    }
  }
}

class BonosModel extends ConectedModel {
  get BonoPrincipal {
    return _bono.valor;
  }

  getBono() async {
    try {
      _bono = Bono.fromJson(await _pref.read("bono"));
      notifyListeners();
    } catch (Excepetion) {
      debugPrint("error on Pref Bono! ");
    }
  }
}

class DatosModel extends ConectedModel {}

class VozModel extends ConectedModel {}

class SmsModel extends ConectedModel {}
