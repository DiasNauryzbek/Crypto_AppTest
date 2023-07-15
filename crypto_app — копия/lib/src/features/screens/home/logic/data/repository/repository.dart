import 'package:crypto_app/src/features/screens/home/logic/data/datasource/datasource.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/crypto_model.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/hist_model.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/search_model.dart';
import 'package:dio/dio.dart';

abstract class HomeRepository {
  Future<List<Result>> getCryptoRequest();
  Future<List<Result>> getCryptoDetailRequest(String cryptoId);
  Future<List<Hist>> getHistoricalRequest(String cryptoId, int days);
  Future<List<SearchModel>> getCryptoSearchRequest(String cryptoName);

}

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeDatasource;

  HomeRepositoryImpl(this.homeDatasource);

  @override
  Future<List<Result>> getCryptoRequest() async {
    Response response = await homeDatasource.getCryptoRequest();
    final List<dynamic> responseData = response.data['results'];
    // final List<dynamic> responseData = response.data['results'];
    return responseData.map((json) => Result.fromJson(json)).toList();
  }

  @override
  Future<List<Result>> getCryptoDetailRequest(String cryptoId) async {
    Response response = await homeDatasource.getCryptoDetailRequest(cryptoId);
    final List<dynamic> responseData = response.data['results'];
    // final List<dynamic> responseData = response.data['results'];
    return responseData.map((json) => Result.fromJson(json)).toList();
  }

  @override
  Future<List<Hist>> getHistoricalRequest(String cryptoId, int days) async {
    Response response =
        await homeDatasource.getHistoricalRequest(cryptoId, days);
    final List<dynamic> responseData = response.data['results'];
    // final List<dynamic> responseData = response.data['results'];
    return responseData.map((json) => Hist.fromJson(json)).toList();
  }

  @override
  Future<List<SearchModel>> getCryptoSearchRequest(String cryptoName) async {
    Response response = await homeDatasource.getCryptoDetailRequest(cryptoName);
    final List<dynamic> responseData = response.data['results'];
    // final List<dynamic> responseData = response.data['results'];
    return responseData.map((json) => SearchModel.fromJson(json)).toList();
  }
}
