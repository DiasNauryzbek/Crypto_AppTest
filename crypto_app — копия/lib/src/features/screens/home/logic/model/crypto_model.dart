import 'package:json_annotation/json_annotation.dart';
part 'crypto_model.g.dart';



@JsonSerializable()
class CryptoModel {
    @JsonKey(name:"queryCount")
    final int queryCount;
    @JsonKey(name:"resultsCount")
    final int resultsCount;
    @JsonKey(name:"adjusted")
    final bool adjusted;
    @JsonKey(name:"results")
    final List<Result> results;
    @JsonKey(name:"status")
    final String status;
    @JsonKey(name:"request_id")
    final String requestId;
    @JsonKey(name:"count")
    final int count;

     CryptoModel({
        required this.queryCount,
        required this.resultsCount,
        required this.adjusted,
        required this.results,
        required this.status,
        required this.requestId,
        required this.count,
    });

    factory CryptoModel.fromJson(Map<String, dynamic> json) => _$CryptoModelFromJson(json);

    Map<String, dynamic> toJson() => _$CryptoModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name:"T")
    final String t;
    @JsonKey(name:"v")
    final double v;
    @JsonKey(name:"vw")
    final double? vw;
    @JsonKey(name:"o")
    final double o;
    @JsonKey(name:"c")
    final double c;
    @JsonKey(name:"h")
    final double h;
    @JsonKey(name:"l")
    final double l;
    @JsonKey(name:"t")
    final int resultT;
    @JsonKey(name:"n")
    final int n;

    Result({
        required this.t,
        required this.v,
        this.vw,
        required this.o,
        required this.c,
        required this.h,
        required this.l,
        required this.resultT,
        required this.n,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);

}