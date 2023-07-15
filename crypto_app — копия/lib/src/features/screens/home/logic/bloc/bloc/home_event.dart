part of 'home_bloc.dart';

class HomeEvent {}

//All CryptoS
class CryptoData extends HomeEvent {}

//Cryptos article
class CryptoDetailDataEvent extends HomeEvent {
  final String cryptoId;

  CryptoDetailDataEvent(this.cryptoId);
}

//Cryptos article
class HistoricalDataEvent extends HomeEvent {
  final String cryptoId;
  final int days;

  HistoricalDataEvent(this.cryptoId, this.days);
}

//Search
class CryptoSearchDataEvent extends HomeEvent {
  final String cryptoName;

  CryptoSearchDataEvent(this.cryptoName);
}


