part of 'covid_country_data_bloc.dart';

abstract class CovidCountryDataState extends Equatable {
  CovidCountryDataState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends CovidCountryDataState {}
class Loading extends CovidCountryDataState {}

class Loaded extends CovidCountryDataState {
  final CovidCountryData data;

  Loaded({@required this.data}) : super([data]);
}

class Error extends CovidCountryDataState {
  final String message;

  Error({@required this.message}) : super([message]);
}