import 'package:bmi_calculator/constants.dart';
import 'file:///C:/Users/DELL/AndroidStudioProjects/Tuts/bmi-calculator-flutter/lib/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0e0f21),
          scaffoldBackgroundColor: Color(0xff110e21),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      routes: {
        kRouteHome: (context) => InputPage(),
        kRouteResults: (context) => Results()
      },
    );
  }
}
