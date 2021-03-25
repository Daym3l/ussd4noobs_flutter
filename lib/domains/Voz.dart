import 'package:flutter/material.dart';

class Voz {
  final double valor;
  final double plan;
  final String prefix;
  final int vence;
  final bool active;

  Voz(
      {@required this.valor,
      @required this.plan,
      @required this.prefix,
      @required this.vence,
      @required this.active});
}
