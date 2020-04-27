import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/covid19/data/datasources/covid_country_local_data_source.dart';
import 'features/covid19/data/datasources/covid_country_remote_data_source.dart';
import 'features/covid19/data/repositories/covid_country_repository_impl.dart';
import 'features/covid19/domain/repositories/covid_country_repository.dart';
import 'features/covid19/domain/usecases/get_covid_country_data.dart';
import 'features/covid19/presentation/bloc/covid_country_data_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  //bloc
  sl.registerFactory(
    () => CovidCountryDataBloc(
      covidCountry: sl(),
      inputConverter: sl(),
    ),
  );

  //use cases
  sl.registerLazySingleton(() => GetCovidCountryData(sl()));

  // Repository
  sl.registerLazySingleton<CovidCountryRepository>(
    () => CovidCountryRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CovidCountryRemoteDataSource>(
    () => CovidCountryRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<CovidCountryLocalDataSource>(
    () => CovidCountryLocalDataSourceImpl(sharedPreferences: sl()),
  );

  
  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}