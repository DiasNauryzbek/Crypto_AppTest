import 'package:json_annotation/json_annotation.dart';
part 'hist_model.g.dart';

@JsonSerializable()
class Hist {
    
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

    Hist({
       
        required this.v,
        this.vw,
        required this.o,
        required this.c,
        required this.h,
        required this.l,
        required this.resultT,
        required this.n,
    });

    factory Hist.fromJson(Map<String, dynamic> json) => _$HistFromJson(json);

    Map<String, dynamic> toJson() => _$HistToJson(this);

}