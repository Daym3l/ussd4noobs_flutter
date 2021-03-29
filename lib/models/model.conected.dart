import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/domains/Bono.dart';
import 'package:ussd4noobs/domains/Datos.dart';
import 'package:ussd4noobs/domains/Saldo.dart';
import 'package:ussd4noobs/helpers/helper.funtions.dart';
import 'package:ussd4noobs/helpers/helper.sharedPref.dart';
import 'package:ussd_service/ussd_service.dart';

class ConectedModel extends Model {
  Saldo _saldo = Saldo(saldo: 0.0, vencimiento: '1/1/2021');
  Bono _bono = Bono(valor: " ");
  Datos _datos = Datos(valor: 0.0, plan: 14.0, vence: 0);

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
      {@required String type, @required String ussdcode}) async {
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
          case 'Saldo':
            {
              await setSaldoPrincipal(ussdResponseMessage, subscriptionId);
            }
            break;
          case 'Datos':
            {
              List<String> res = ussdResponseMessage.split(" ");
              print(res);
              if (res.length == 8) {
                _datos = Datos(
                    valor: HelperFunctions.convertToGB(res[3], res[4]),
                    plan: 2.5,
                    vence: int.parse(res[6]));
              }
              if (res.length == 9) {
                _datos = Datos(
                    valor: HelperFunctions.convertToGB(res[4], res[5]),
                    plan: 2.5,
                    vence: int.parse(res[7]));
              }
              _pref.save("datos", _datos);
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

  Future setSaldoPrincipal(
      String ussdResponseMessage, int subscriptionId) async {
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

class DatosModel extends ConectedModel {
  get DatosPrincipal {
    return _datos.valor;
  }

  get DatosPlan {
    return _datos.plan;
  }

  get VenceDatosDias {
    return _datos.vence;
  }

  getDatos() async {
    try {
      _datos = Datos.fromJson(await _pref.read("datos"));
      notifyListeners();
    } catch (Excepetion) {
      debugPrint("error on Pref Datos! ");
    }
  }
}

class VozModel extends ConectedModel {}

class SmsModel extends ConectedModel {}
