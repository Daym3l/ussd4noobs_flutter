import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ussd/ussd.dart';
import 'package:ussd4noobs/domains/Bono.dart';
import 'package:ussd4noobs/domains/Datos.dart';
import 'package:ussd4noobs/domains/Saldo.dart';
import 'package:ussd4noobs/domains/Sms.dart';
import 'package:ussd4noobs/domains/Voz.dart';

import 'package:ussd4noobs/helpers/helper.sharedPref.dart';
import 'package:ussd_service/ussd_service.dart';
import 'package:sim_data/sim_data.dart';

class ConectedModel extends Model {
  Saldo _saldo = Saldo(saldo: 0.0, vencimiento: '1/1/2021');
  Bono _bono = Bono(valor: "Sin Bonificación.");
  Datos _datos = Datos(valor: 0.0, plan: 0.0, vence: 0, prefix: 'MB');
  Voz _voz = Voz(valor: '00:00:00', plan: 0.0, vence: 0);
  Sms _sms = Sms(valor: '0', plan: 0.0, vence: 0);

  bool _isLoaing = false;
  bool _isLoaingDatos = false;
  bool _isLoaingVoz = false;
  bool _isLoaingSms = false;
  SharedPref _pref = SharedPref();

  bool get getLoading {
    return _isLoaing;
  }

  bool get getLoadingDatos {
    return _isLoaingDatos;
  }

  bool get getLoadingVoz {
    return _isLoaingVoz;
  }

  bool get getLoadingSms {
    return _isLoaingSms;
  }

  _checkPermision_call() async {
    var phoneStatus = await Permission.phone.status;
    if (!phoneStatus.isGranted) {
      await Permission.phone.request();
    }
  }

  Future<void> exeCallUssd({
    @required String ussdcode,
  }) async {
    await _checkPermision_call();

    if (await Permission.phone.isGranted) {
      notifyListeners();
      try {
        Ussd.runUssd(ussdcode);
      } catch (e) {
        debugPrint("error! code: ${e.code} - message: ${e.message}");
      }
    }
  }

  void _loadingState(String type) {
    switch (type) {
      case 'Datos':
        {
          _isLoaingDatos = true;
          notifyListeners();
        }
        break;
      case 'Voz':
        {
          _isLoaingVoz = true;
          notifyListeners();
        }
        break;
      case 'SMS':
        {
          {
            _isLoaingSms = true;
            notifyListeners();
          }
          break;
        }
        break;
      default:
        {
          _isLoaing = true;
          notifyListeners();
        }
    }
  }

  Future<bool> makeMyCall(
      {@required String type, @required String ussdcode}) async {
    await _checkPermision_call();
    bool success = true;
    if (await Permission.phone.isGranted) {
      int subscriptionId = 1; // sim card subscription ID
      _loadingState(type);
      notifyListeners();
      SimData simData = await SimDataPlugin.getSimData();
      simData.cards.forEach((SimCard s) {
        subscriptionId = s.subscriptionId;
      });
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
              setDatosPrincipal(ussdResponseMessage);
            }
            break;
          case 'Voz':
            {
              setVozPrincipal(ussdResponseMessage);
            }
            break;
          case 'SMS':
            {
              {
                setSmsPrincipal(ussdResponseMessage);
              }
              break;
            }
            break;
          default:
            {
              success = false;
            }
        }
      } on PlatformException catch (e) {
        _isLoaing = false;
        _isLoaingDatos = false;
        _isLoaingVoz = false;
        _isLoaingSms = false;
        success = false;
        print("error! code: ${e.code} - message: ${e.message}");
      }
    }
    _isLoaing = false;
    _isLoaingDatos = false;
    _isLoaingVoz = false;
    _isLoaingSms = false;
    notifyListeners();
    return success;
  }

  void setSmsPrincipal(String ussdResponseMessage) {
    List<String> res = ussdResponseMessage.split(" ");

    if (res[2] == "adquirir") {
      _sms = Sms(valor: '0', plan: 0, vence: 0);
    } else {
      _sms = Sms(valor: res[3], plan: _sms.plan, vence: int.parse(res[7]));
    }
    _pref.save("sms", _sms);
  }

  void setVozPrincipal(String ussdResponseMessage) {
    List<String> res = ussdResponseMessage.split(" ");

    if (res[2] == "adquirir") {
      _voz = Voz(valor: '00:00:00', plan: 0.0, vence: 0);
    } else {
      _voz = Voz(valor: res[3], plan: 0.0, vence: int.parse(res[7]));
    }
    _pref.save("voz", _voz);
  }

  void setDatosPrincipal(String ussdResponseMessage) async {
    List<String> res = ussdResponseMessage.split(" ");

    if (res[4] == "adquirir" && res[5] == "adquirir") {
      _datos = Datos(valor: 0.0, plan: 0.0, vence: 0, prefix: 'MB');
    } else {
      if (res.length == 8 || res.length == 12) {
        _datos = Datos(
            valor: double.parse(res[3]),
            plan: _datos.plan,
            prefix: res[4],
            vence: int.parse(res[6]));
      }
      if (res.length == 9 || res.length == 13) {
        _datos = Datos(
            valor: double.parse(res[4]),
            plan: _datos.plan,
            prefix: res[5],
            vence: int.parse(res[res.length == 13 ? 11 : 7]));
      }
    }

    _pref.save("datos", _datos);
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

  get PrefixDatos {
    return _datos.prefix;
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

class VozModel extends ConectedModel {
  get VozPrincipal {
    return _voz.valor;
  }

  get VozPlan {
    return _voz.plan;
  }

  get VenceVozDias {
    return _voz.vence;
  }

  getVoz() async {
    try {
      _voz = Voz.fromJson(await _pref.read("voz"));
      notifyListeners();
    } catch (Excepetion) {
      debugPrint("error on Pref Voz! ");
    }
  }
}

class SmsModel extends ConectedModel {
  get SmsPrincipal {
    return _sms.valor;
  }

  get SmsPlan {
    return _sms.plan;
  }

  get VenceSmsDias {
    return _sms.vence;
  }

  getSms() async {
    try {
      _sms = Sms.fromJson(await _pref.read("sms"));
      notifyListeners();
    } catch (Excepetion) {
      debugPrint("error on Pref Sms! ");
    }
  }
}
