import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/covid_country_data.dart';
import '../repositories/covid_country_repository.dart';

class GetCovidCountryData implements UseCase<CovidCountryData, Params>{
  final CovidCountryRepository repository;

  GetCovidCountryData(this.repository);


  @override
  Future<Either<Failure, CovidCountryData>> call(
    Params params
  ) async {
    return await repository.getCovidCountryData(params.string);
  }
}

class Params extends Equatable {
  final String string;

  Params({@required this.string}) : super([string]);

}