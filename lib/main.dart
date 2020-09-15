import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0E0E21),
        scaffoldBackgroundColor: Color(0xFF0E0E21),
      ),
      initialRoute: '/',
      routes: {
    '/': (context) {
      return InputPage();
    },
    '/results': (context) {
      return ResultPage();
    }
    },
    );
  }
}


