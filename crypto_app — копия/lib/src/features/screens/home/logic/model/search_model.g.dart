// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      ticker: json['ticker'] as String,
      name: json['name'] as String,
      market: json['market'] as String,
      locale: json['locale'] as String,
      active: json['active'] as bool,
      currency_symbol: json['currency_symbol'] as String,
      currency_name: json['currency_name'] as String,
      base_currency_symbol: json['base_currency_symbol'] as String,
      base_currency_name: json['base_currency_name'] as String,
      last_updated_utc: json['last_updated_utc'] as String,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'name': instance.name,
      'market': instance.market,
      'locale': instance.locale,
      'active': instance.active,
      'currency_symbol': instance.currency_symbol,
      'currency_name': instance.currency_name,
      'base_currency_symbol': instance.base_currency_symbol,
      'base_currency_name': instance.base_currency_name,
      'last_updated_utc': instance.last_updated_utc,
    };
