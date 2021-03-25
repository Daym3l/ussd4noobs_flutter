import 'package:flutter/material.dart';

class Sms {
  final int valor;
  final int plan;
  final String prefix;
  final int vence;
  final bool active;

  Sms(
      {@required this.valor,
      @required this.plan,
      @required this.prefix,
      @required this.vence,
      @required this.active});
}
