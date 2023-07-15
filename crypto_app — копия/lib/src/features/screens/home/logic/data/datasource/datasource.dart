import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class HomeDatasource {
  Future<Response> getCryptoRequest();
  Future<Response> getCryptoDetailRequest(String cryptoId);
  Future<Response> getHistoricalRequest(String cryptoId, int days);
  Future<Response> getCryptoSearchRequest(String cryptoName);


}

class HomeDatasourceImpl implements HomeDatasource {
  Dio dio = Dio();
  String apiKey = '70ojD4YCtLTKsYRYQrXUEju0E4p4pbC_';
  String formatDate(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  @override
  Future<Response> getCryptoRequest() async {
    return await dio.get(
      'https://api.polygon.io/v2/aggs/grouped/locale/global/market/crypto/2023-01-09?adjusted=true&apiKey=$apiKey',
    );
  }

  @override
  Future<Response> getCryptoDetailRequest(String cryptoId) async {
    return await dio.get(
      'https://api.polygon.io/v2/aggs/ticker/$cryptoId/prev?adjusted=true&apiKey=$apiKey',
    );
    /* return await dio.get(
      'https://api.polygon.io/v2/aggs/grouped/locale/global/market/crypto/2023-01-09?adjusted=true&apiKey=$apiKey',
    ); */
  }

  @override
  Future<Response> getHistoricalRequest(String cryptoId, int days) async {
    DateTime startDate = DateTime(2022, 7, 14);
  DateTime endDate = startDate.add(Duration(days: days - 1));

  String startDateString = formatDate(startDate);
  String endDateString = formatDate(endDate);
  print(startDateString + 'startDate');
  print(endDateString + 'last');
    print(days);
    print(cryptoId);

    return await dio.get(
      'https://api.polygon.io/v2/aggs/ticker/$cryptoId/range/$days/hour/2023-01-09/2023-01-09?adjusted=true&sort=asc&limit=120&apiKey=70ojD4YCtLTKsYRYQrXUEju0E4p4pbC_'
    //  'https://api.polygon.io/v2/aggs/ticker/$cryptoId/range/$days/day/$startDateString/$endDateString?adjusted=true&sort=asc&limit=5000&apiKey=$apiKey',
    );
  }

 @override
  Future<Response> getCryptoSearchRequest(String cryptoName) async {
    try {
      final response = await dio.get(
        'https://api.polygon.io/v3/reference/tickers?search=X:$cryptoName&active=true&apiKey=$apiKey',
      );

      print('Crypto Search Response Status Code: ${response.statusCode}');
      print('Crypto Search Response Data: ${response.data}');

      return response;
    } catch (e) {
      print('Crypto Search Error: $e');
      throw e;
    }
  }


}
