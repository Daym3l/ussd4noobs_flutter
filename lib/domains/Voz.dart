import 'package:flutter/material.dart';

class Voz {
  final String valor;
  final double plan;
  final int vence;

  Voz({
    @required this.valor,
    @required this.plan,
    @required this.vence,
  });

  Voz.fromJson(Map<String, dynamic> json)
      : valor = json['valor'],
        plan = json['plan'],
        vence = json['vence'];

  Map<String, dynamic> toJson() => {
        'valor': valor,
        'plan': plan,
        'vence': vence,
      };
}
