import 'package:covid_19/features/covid19/domain/entities/covid_country_data.dart';
import 'package:flutter/material.dart';

  Widget covidDeaths(final CovidCountryData covidCountryData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0,top: 5),
          child: Container(child: Text("Deaths",
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
        ),
        Container(
          child: Text(covidCountryData.deaths.toString(),
          style: TextStyle(color: Colors.redAccent, fontSize: 30.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
      ],
    );   
  }
  
  Widget covidCases(final CovidCountryData covidCountryData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0,top: 5),
          child: Container(child: Text("Cases",
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
        ),
        Container(
          child: Text(covidCountryData.cases.toString(),
          style: TextStyle(color: Colors.blueAccent, fontSize: 30.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
      ],
    );   
  }

  Widget covidTodayCases(final CovidCountryData covidCountryData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0,top: 5),
          child: Container(child: Text("Today Cases",
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0,fontFamily: 'Proxima',fontWeight: FontWeight.bold),)),
        ),
        Container(
          child: Text(covidCountryData.todayCases.toString(),
          style: TextStyle(color: Colors.blueAccent, fontSize: 30.0,fontFamily: 'Proxima',fontWeight: FontWeight.bold),)),
      ],
    );   
  }

  Widget covidTodayDeaths(final CovidCountryData covidCountryData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0,top: 5),
          child: Container(child: Text("Today Deaths",
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0,fontFamily: 'Proxima',fontWeight: FontWeight.bold),)),
        ),
        Container(
          child: Text(covidCountryData.todayDeaths.toString(),
          style: TextStyle(color: Colors.redAccent, fontSize: 30.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
      ],
    );   
  }

  Widget covidRecovered(final CovidCountryData covidCountryData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0,top: 5),
          child: Container(child: Text("Recovered",
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
        ),
        Container(
          child: Text(covidCountryData.recovered.toString(),
          style: TextStyle(color: Colors.green[400], fontSize: 30.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
      ],
    );   
  } 

  Widget covidActive(final CovidCountryData covidCountryData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0,top: 5),
          child: Container(child: Text("Active",
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
        ),
        Container(
          child: Text(covidCountryData.active.toString(),
          style: TextStyle(color: Colors.orangeAccent, fontSize: 30.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
      ],
    );   
  }

  Widget covidCritical(final CovidCountryData covidCountryData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0,top: 5),
          child: Container(child: Text("Critical",
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
        ),
        Container(
          child: Text(covidCountryData.critical.toString(),
          style: TextStyle(color: Colors.redAccent, fontSize: 30.0,fontWeight: FontWeight.bold,fontFamily: 'Proxima',),)),
      ],
    );   
  }