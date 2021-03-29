import 'package:flutter/material.dart';

class Datos {
  final double valor;
  final double plan;
  final int vence;

  Datos({
    @required this.valor,
    @required this.plan,
    @required this.vence,
  });

  Datos.fromJson(Map<String, dynamic> json)
      : valor = json['valor'],
        plan = json['plan'],
        vence = json['vence'];

  Map<String, dynamic> toJson() => {
        'valor': valor,
        'plan': plan,
        'vence': vence,
      };
}
