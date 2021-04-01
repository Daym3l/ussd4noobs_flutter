import 'package:flutter/material.dart';

class Datos {
  final double valor;
  final double plan;
  final int vence;
  final String prefix;

  Datos({
    @required this.valor,
    @required this.plan,
    @required this.vence,
    @required this.prefix,
  });

  Datos.fromJson(Map<String, dynamic> json)
      : valor = json['valor'],
        plan = json['plan'],
        prefix = json['prefix'],
        vence = json['vence'];

  Map<String, dynamic> toJson() => {
        'valor': valor,
        'plan': plan,
        'vence': vence,
        'prefix': prefix,
      };
}
