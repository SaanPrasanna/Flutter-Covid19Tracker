import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CovidCountryData extends Equatable{
  final String country;
  final String flagUrl;
  final int todayCases;
  final int todayDeaths;
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int critical;

  CovidCountryData({
    @required this.country,
    @required this.flagUrl,
    @required this.todayCases, 
    @required this.todayDeaths, 
    @required this.cases,
    @required this.deaths, 
    @required this.recovered,
    @required this.active,
    @required this.critical,
  }): super([country,flagUrl,todayCases,todayDeaths,cases,deaths,recovered,active,critical]);
  
}