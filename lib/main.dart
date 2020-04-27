import 'package:flutter/material.dart';

import 'features/covid19/presentation/pages/covid_country_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Tracker',
      theme: ThemeData(
        primaryColor: Colors.blue.shade800,
        accentColor: Colors.blue.shade600,
      ),
      home: CovidCountryPage(),
    );
  }
}