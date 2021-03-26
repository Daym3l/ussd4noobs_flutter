import 'package:flutter/material.dart';

class Saldo {
  double saldo;
  String vencimiento;

  Saldo({@required this.saldo, @required this.vencimiento});

  Saldo.fromJson(Map<String, dynamic> json)
      : saldo = json['saldo'],
        vencimiento = json['vencimiento'];

  Map<String, dynamic> toJson() => {'saldo': saldo, 'vencimiento': vencimiento};
}
