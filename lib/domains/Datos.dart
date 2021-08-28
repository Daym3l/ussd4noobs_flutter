import 'package:flutter/material.dart';

class Datos {
  final double valor;
  final double valorLTE;
  final double plan;
  final int vence;
  final String prefix;
  final String prefixLTE;

  Datos({
    @required this.valor,
    @required this.valorLTE,
    @required this.plan,
    @required this.vence,
    @required this.prefix,
    @required this.prefixLTE,
  });

  Datos.fromJson(Map<String, dynamic> json)
      : valor = json['valor'],
        valorLTE = json['valorLTE'],
        plan = json['plan'],
        prefix = json['prefix'],
        prefixLTE = json['prefixLTE'],
        vence = json['vence'];

  Map<String, dynamic> toJson() => {
        'valor': valor,
        'valorLTE': valorLTE,
        'plan': plan,
        'vence': vence,
        'prefix': prefix,
        'prefixLTE': prefixLTE,
      };
}
