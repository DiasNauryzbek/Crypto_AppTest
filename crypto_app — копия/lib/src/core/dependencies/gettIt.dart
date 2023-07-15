import 'package:crypto_app/src/features/screens/home/logic/bloc/bloc/home_bloc.dart';
import 'package:crypto_app/src/features/screens/home/logic/data/datasource/datasource.dart';
import 'package:crypto_app/src/features/screens/home/logic/data/repository/repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() async {


  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt()));

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()));

  getIt.registerLazySingleton<HomeDatasource>(() => HomeDatasourceImpl());
}