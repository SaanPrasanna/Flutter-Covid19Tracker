import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/covid_country_data_bloc.dart';
import '../widgets/widgets.dart';

class CovidCountryPage extends StatefulWidget {
  @override
  _CovidCountryPageState createState() => _CovidCountryPageState();
}

class _CovidCountryPageState extends State<CovidCountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('covid-19 tracker'.toUpperCase()),
      ),
      body: SingleChildScrollView(child: buildBody()),
    );
  }

  BlocProvider<CovidCountryDataBloc> buildBody() {
    return BlocProvider(
      builder: (_) => sl<CovidCountryDataBloc>(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height:10.0),
            BlocBuilder<CovidCountryDataBloc, CovidCountryDataState>(
                builder: (context, state) {
                  if(state is Empty){
                    return DisplayMessage(message: 'COVID-19 Info!',);
                  }else if(state is Loading){
                    return LoadingWidget();
                  }else if(state is Loaded){
                    return DataDisplay(covidCountryData: state.data,);
                  }else if(state is Error){
                    return DisplayMessage(message: state.message,);
                  }
                },
              ),
              
            SizedBox(height: 10.0,),  

            CovidDataControls(),

          ]
        ),
      ),
    );
  }
}

