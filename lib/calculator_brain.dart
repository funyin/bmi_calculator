import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  final int weight;
  final int height;

  double _bmi;

  CalculatorBrain({@required this.weight, @required this.height});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi <= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi <= 25) {
      return 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes';
    } else if (_bmi > 18.5) {
      return 'Low Risk (healthy range)';
    } else if (_bmi < 18.5) {
      return 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes';
    } else {
      return 'High risk of developing heart disease, high blood pressure, stroke, diabetes';
    }
  }
}
