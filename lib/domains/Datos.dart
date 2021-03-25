import 'package:flutter/material.dart';

class Datos {
  final double valor;
  final double plan;
  final String prefix;
  final int vence;
  final bool active;

  Datos(
      {@required this.valor,
      @required this.plan,
      @required this.prefix,
      @required this.vence,
      @required this.active});
}
