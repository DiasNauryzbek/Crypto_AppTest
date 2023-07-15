import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
 class CartCryptoDa {
  final int time;
  final double open;
  final double close;
  final double high;
  final double low;

  CartCryptoDa({
    required this.time,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  });
}
 