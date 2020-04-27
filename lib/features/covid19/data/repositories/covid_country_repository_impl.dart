import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/covid_country_data.dart';
import '../../domain/repositories/covid_country_repository.dart';
import '../datasources/covid_country_local_data_source.dart';
import '../datasources/covid_country_remote_data_source.dart';


typedef Future<CovidCountryData> _CovidCountryDataChooser();

class CovidCountryRepositoryImpl implements CovidCountryRepository {
  final CovidCountryRemoteDataSource remoteDataSource;
  final CovidCountryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CovidCountryRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, CovidCountryData>> getCovidCountryData(
    String string,
  ) async {
    return await _getData(() {
      return remoteDataSource.getCovidCountryData(string);
    });
  }


  Future<Either<Failure, CovidCountryData>> _getData(
    _CovidCountryDataChooser getCovidData,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await getCovidData();
        localDataSource.cacheCovidCountryData(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localData = await localDataSource.getLastCovidCountryData();
        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

}