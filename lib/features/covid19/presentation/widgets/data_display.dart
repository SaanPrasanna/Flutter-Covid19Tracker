import 'package:flutter/material.dart';

import '../../domain/entities/covid_country_data.dart';
import 'widgets.dart';

class DataDisplay extends StatelessWidget {
  final CovidCountryData covidCountryData;

  const DataDisplay({
    Key key, 
    @required this.covidCountryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.75,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10,left:50,right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                   width:70,
                   height: 50,
                   child: ClipRRect(
                     child: Image.network(covidCountryData.flagUrl,width: 80,),
                   ),
                 ),
                 SizedBox(width: 10,),
                Expanded(child: Container(child: Text(covidCountryData.country,style: TextStyle(fontSize: 35.0,fontFamily: 'Proxima'),),),),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 15,),
            child: Container(
                child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    borderRadius: BorderRadius.circular(12.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width:50,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset('assets/confirmed.gif',width: 80,),
                          ),
                        ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: covidTodayCases(covidCountryData),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 15),
            child: Container(
                child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    borderRadius: BorderRadius.circular(12.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width:50,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset('assets/death.gif',width: 80,),
                          ),
                        ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: covidTodayDeaths(covidCountryData),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 15,),
            child: Container(
                child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    borderRadius: BorderRadius.circular(12.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width:50,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset('assets/confirmed.gif',width: 80,),
                          ),
                        ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: covidCases(covidCountryData),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 15),
            child: Container(
                child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    borderRadius: BorderRadius.circular(12.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width:50,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset('assets/death.gif',width: 80,),
                          ),
                        ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: covidDeaths(covidCountryData),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 15,),
            child: Container(
                child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    borderRadius: BorderRadius.circular(12.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width:50,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset('assets/recovered.gif',width: 80,),
                          ),
                        ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: covidRecovered(covidCountryData),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 15),
            child: Container(
                child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    borderRadius: BorderRadius.circular(12.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width:50,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset('assets/suspected.gif',width: 80,),
                          ),
                        ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: covidActive(covidCountryData),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 15,),
            child: Container(
                child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    borderRadius: BorderRadius.circular(12.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width:50,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset('assets/death.gif',width: 80,),
                          ),
                        ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: covidCritical(covidCountryData),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
          ),

        ],
      ),
    );
  }
}
