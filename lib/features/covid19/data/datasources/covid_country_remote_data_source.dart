import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/errors/exception.dart';
import '../models/covid_country_model.dart';


abstract class CovidCountryRemoteDataSource {
  /// Calls the https://corona.lmao.ninja/v2/countries/{country}endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CovidCountryModel> getCovidCountryData(String string);

}

class CovidCountryRemoteDataSourceImpl implements CovidCountryRemoteDataSource {

  final http.Client client;

  CovidCountryRemoteDataSourceImpl({@required this.client});

  @override
  Future<CovidCountryModel> getCovidCountryData(String string) => _getCovidCountryDataFromUrl('https://corona.lmao.ninja/v2/countries/$string');

  Future<CovidCountryModel> _getCovidCountryDataFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CovidCountryModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

}