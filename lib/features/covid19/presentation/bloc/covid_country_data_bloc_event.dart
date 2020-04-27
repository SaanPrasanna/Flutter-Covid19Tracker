part of 'covid_country_data_bloc.dart';

abstract class CovidCountryDataEvent extends Equatable {
  CovidCountryDataEvent([List props = const <dynamic>[]]) : super(props);
}
class GetDataForCovidCountry extends CovidCountryDataEvent {
  final String string;

  GetDataForCovidCountry(this.string) : super([string]);
}
