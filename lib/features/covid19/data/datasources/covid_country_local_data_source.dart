import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exception.dart';
import '../models/covid_country_model.dart';

abstract class CovidCountryLocalDataSource {
  /// Gets the cached [CovidCountryModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<CovidCountryModel> getLastCovidCountryData();

  Future<void> cacheCovidCountryData(CovidCountryModel triviaToCache);
}

const CACHED_COUNTRY_DATA = 'CACHED_COUNTRY_DATA';

class CovidCountryLocalDataSourceImpl implements CovidCountryLocalDataSource{
  final SharedPreferences sharedPreferences;

  CovidCountryLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<CovidCountryModel> getLastCovidCountryData() {
    final jsonString = sharedPreferences.getString(CACHED_COUNTRY_DATA);
    if(jsonString != null){
      return Future.value(CovidCountryModel.fromJson(json.decode(jsonString)));
    }else{
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCovidCountryData(CovidCountryModel covidDataToCache) {
    return sharedPreferences.setString(
      CACHED_COUNTRY_DATA,json.encode(covidDataToCache.toJson())
    );
  }
}