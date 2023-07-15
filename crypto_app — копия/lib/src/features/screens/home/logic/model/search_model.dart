import 'package:json_annotation/json_annotation.dart';
part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
    @JsonKey(name:"ticker")
    final String ticker;
    @JsonKey(name:"name")
    final String name;
    @JsonKey(name:"market")
    final String market;
    @JsonKey(name:"locale")
    final String locale;
    @JsonKey(name:"active")
    final bool active;
    @JsonKey(name:"currency_symbol")
    final String currency_symbol;
    @JsonKey(name:"currency_name")
    final String currency_name;
    @JsonKey(name:"base_currency_symbol")
    final String base_currency_symbol;
    @JsonKey(name:"base_currency_name")
    final String base_currency_name;
    @JsonKey(name:"last_updated_utc")
    final String last_updated_utc;

    SearchModel({
        required this.ticker,
        required this.name,
        required this.market,
        required this.locale,
        required this.active,
        required this.currency_symbol,
        required this.currency_name,
        required this.base_currency_symbol,
        required this.base_currency_name,
        required this.last_updated_utc,

    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);

    Map<String, dynamic> toJson() => _$SearchModelToJson(this);

}