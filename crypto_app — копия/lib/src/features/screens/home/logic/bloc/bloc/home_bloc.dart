import 'package:bloc/bloc.dart';
import 'package:crypto_app/src/features/screens/home/logic/data/repository/repository.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/crypto_model.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/hist_model.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/search_model.dart';
import 'package:dio/dio.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc(this.homeRepository) : super(HomeInitialState()) {
    on<CryptoData>((event, emit) async {
      emit(CryptoLoading());
      try {
        final cryptoData = await homeRepository.getCryptoRequest();
        emit(CryptoSuccess(cryptoData: cryptoData));
      } catch (e) {
        emit(CryptoFail(message: e.toString()));
      }
    });

    on<CryptoDetailDataEvent>(
      (event, emit) async {
        emit(CryptoDetailLoading());

        try {
          final cryptoDetail =
              await homeRepository.getCryptoDetailRequest(event.cryptoId);
          emit(CryptoDetailSuccess(cryptoDetail));
          print(cryptoDetail);
        } catch (e) {
          emit(CryptoDetailFailed("Error retrieving genre detail."));
        }
      },
    );

    on<HistoricalDataEvent>(
      (event, emit) async {
        emit(HistoricalDataLoading());

        try {
          final cryptoDetail = await homeRepository.getHistoricalRequest(
              event.cryptoId, event.days);
          emit(HistoricalDataSuccess(cryptoDetail));
        } catch (e) {
          emit(HistoricalDataFailed(message: e.toString()));
        }
      },
    );

    on<CryptoSearchDataEvent>(
  (event, emit) async {
    emit(CryptoSearchLoading());

    try {
      final searchDetail = await homeRepository.getCryptoSearchRequest(event.cryptoName);

      if (searchDetail != null) {
        if (searchDetail is List<dynamic>) {
          emit(CryptoSearchSuccess(searchDetail));
        } else {
          emit(CryptoSearchError(errorMessage: 'Invalid search result format.'));
        }
      } else {
        emit(CryptoSearchError(errorMessage: 'Search results are null.'));
      }
    } catch (e) {
      emit(CryptoSearchError(errorMessage: 'Search error: $e'));
    }
  },
);






  }
}
