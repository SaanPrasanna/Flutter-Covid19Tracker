import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/covid_country_data.dart';

abstract class CovidCountryRepository {
  Future<Either<Failure, CovidCountryData>> getCovidCountryData(String country);
}