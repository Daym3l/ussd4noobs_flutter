import 'package:flutter/material.dart';

class Bono {
  final String valor;

  Bono({
    @required this.valor,
  });

  Bono.fromJson(Map<String, dynamic> json) : valor = json['valor'];

  Map<String, dynamic> toJson() => {'valor': valor};
}
