// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoModel _$CryptoModelFromJson(Map<String, dynamic> json) => CryptoModel(
      queryCount: json['queryCount'] as int,
      resultsCount: json['resultsCount'] as int,
      adjusted: json['adjusted'] as bool,
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      requestId: json['request_id'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$CryptoModelToJson(CryptoModel instance) =>
    <String, dynamic>{
      'queryCount': instance.queryCount,
      'resultsCount': instance.resultsCount,
      'adjusted': instance.adjusted,
      'results': instance.results,
      'status': instance.status,
      'request_id': instance.requestId,
      'count': instance.count,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      t: json['T'] as String,
      v: (json['v'] as num).toDouble(),
      vw: (json['vw'] as num?)?.toDouble(),
      o: (json['o'] as num).toDouble(),
      c: (json['c'] as num).toDouble(),
      h: (json['h'] as num).toDouble(),
      l: (json['l'] as num).toDouble(),
      resultT: json['t'] as int,
      n: json['n'] as int,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'T': instance.t,
      'v': instance.v,
      'vw': instance.vw,
      'o': instance.o,
      'c': instance.c,
      'h': instance.h,
      'l': instance.l,
      't': instance.resultT,
      'n': instance.n,
    };
