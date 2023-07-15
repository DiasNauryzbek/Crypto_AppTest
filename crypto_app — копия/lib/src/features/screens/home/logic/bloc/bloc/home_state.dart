part of 'home_bloc.dart';

class HomeState {}

class HomeInitialState extends HomeState {}

//All cryptos
class CryptoLoading extends HomeState {}

class CryptoSuccess extends HomeState {
  final List<Result> cryptoData;

  CryptoSuccess({required this.cryptoData});
}

class CryptoFail extends HomeState {
  final String message;

  CryptoFail({required this.message});
}

//Cryptos article
class CryptoDetailLoading extends HomeState {}

class CryptoDetailSuccess extends HomeState {
  final List<Result> cryptoDetail;

  CryptoDetailSuccess(this.cryptoDetail);
}

class CryptoDetailFailed extends HomeState {
  final String message;

  CryptoDetailFailed(this.message);
}

//For graphic Historical Data
class HistoricalDataLoading extends HomeState {}

class HistoricalDataSuccess extends HomeState {
  final List<Hist> cryptoDetail;

  HistoricalDataSuccess(this.cryptoDetail);
}

class HistoricalDataFailed extends HomeState {
  final String message;

  HistoricalDataFailed({required this.message});
}

//For search
class CryptoSearchLoading extends HomeState {}

class CryptoSearchSuccess extends HomeState {
  final List<SearchModel> results;

  CryptoSearchSuccess(this.results);
}

class CryptoSearchError extends HomeState {
  final String errorMessage;

  CryptoSearchError({required this.errorMessage});
}


