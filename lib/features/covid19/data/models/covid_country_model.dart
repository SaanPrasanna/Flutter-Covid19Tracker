import 'package:meta/meta.dart';

import '../../domain/entities/covid_country_data.dart';

class CovidCountryModel extends CovidCountryData{

//    {
//      "country": "Sri Lanka"
//      "countryInfo":{"flag":"https://corona.lmao.ninja/assets/img/flags/lk.png"}
//      "todayCases":42105,
//      "todayDeaths":3446,
//      "deaths":200545,
//      "cases":2870931,
//      "recovered":823221,
//    }

  CovidCountryModel({
    @required String country,
    @required String flagUrl,
    @required int todayCases, 
    @required int todayDeaths, 
    @required int cases,
    @required int deaths, 
    @required int recovered,
    @required int active,
    @required int critical
  }): super(country: country, flagUrl: flagUrl,todayCases: todayCases, todayDeaths: todayDeaths, cases: cases, deaths: deaths, recovered: recovered,active: active, critical: critical);

  factory CovidCountryModel.fromJson(Map<String, dynamic> json){
    return CovidCountryModel(
      country: json['country'],
      flagUrl: json['countryInfo']['flag'],
      todayCases: (json['todayCases'] as num).toInt(),
      todayDeaths: (json['todayDeaths'] as num).toInt(),
      deaths: (json['deaths'] as num).toInt(),
      cases: (json['cases'] as num).toInt(),
      recovered: (json['recovered'] as num).toInt(),
      active: (json['active'] as num).toInt(),
      critical: (json['critical'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'country': country,
      'flagUrl': flagUrl,
      'todayCases': todayCases,
      'todayDeaths': todayDeaths,
      'deaths': deaths,
      'cases': cases,
      'recovered': recovered,
      'active': active,
      'critical': critical,
    };
  }
}
