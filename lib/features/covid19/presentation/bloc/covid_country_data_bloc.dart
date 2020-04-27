import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/util/input_converter.dart';
import '../../domain/entities/covid_country_data.dart';
import '../../domain/usecases/get_covid_country_data.dart';

part 'covid_country_data_bloc_event.dart';
part 'covid_country_data_bloc_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input - The Number must be positive integer ir zero';

class CovidCountryDataBloc extends Bloc<CovidCountryDataEvent, CovidCountryDataState> {

  final GetCovidCountryData getCovidCountryData;
  final InputConverter inputConverter;

  CovidCountryDataBloc({
    @required GetCovidCountryData covidCountry,
    @required this.inputConverter,
  })  : assert(covidCountry != null),
        assert(inputConverter != null),
        getCovidCountryData = covidCountry;
        
  @override
  CovidCountryDataState get initialState => Empty();

  @override
  Stream<CovidCountryDataState> mapEventToState(
    CovidCountryDataEvent event,
  ) async* {
    if (event is GetDataForCovidCountry) {
      final country = inputConverter.checker(event.string);
      yield* country.fold(
        (faliure) async* {
          yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (string) async* {
          yield Loading();
          final response = await getCovidCountryData(Params(string: string));
          yield response.fold(
            (faliure) => Error(message: _mapFailureToMessage(faliure)),
            (covidCountry) => Loaded(data: covidCountry),
          );
        },
      );
    }
  }
  String _mapFailureToMessage(Failure failure) {
    // Instead of a regular 'if (failure is ServerFailure)...'
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
