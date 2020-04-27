import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/covid_country_data_bloc.dart';

class CovidDataControls extends StatefulWidget {
  const CovidDataControls({
    Key key,
  }) : super(key: key);

  @override
  _CovidDataControlsState createState() => _CovidDataControlsState();
}

class _CovidDataControlsState extends State<CovidDataControls> {
  String inputStr;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          child: TextField(
            controller: controller,
            onChanged: (value){
              inputStr = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.text_fields),
              border: OutlineInputBorder(),
              hintText: 'Enter Country'
            ),
          ),
        ),
        SizedBox(height:10.0),
        Row(
          children:[
            Expanded(child: Container(
              child: RaisedButton(
                onPressed: dispatchConcrete,
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
              ),
            )),
          ]
        ),
      ],
    );
  }

    void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<CovidCountryDataBloc>(context).dispatch(GetDataForCovidCountry(inputStr));
  }
}

