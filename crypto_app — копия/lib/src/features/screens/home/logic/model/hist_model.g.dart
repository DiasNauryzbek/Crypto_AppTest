// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hist _$HistFromJson(Map<String, dynamic> json) => Hist(
      v: (json['v'] as num).toDouble(),
      vw: (json['vw'] as num?)?.toDouble(),
      o: (json['o'] as num).toDouble(),
      c: (json['c'] as num).toDouble(),
      h: (json['h'] as num).toDouble(),
      l: (json['l'] as num).toDouble(),
      resultT: json['t'] as int,
      n: json['n'] as int,
    );

Map<String, dynamic> _$HistToJson(Hist instance) => <String, dynamic>{
      'v': instance.v,
      'vw': instance.vw,
      'o': instance.o,
      'c': instance.c,
      'h': instance.h,
      'l': instance.l,
      't': instance.resultT,
      'n': instance.n,
    };
