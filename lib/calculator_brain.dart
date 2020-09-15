import 'dart:math';


class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;
  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String determineHealth() {
    if (_bmi >= 25) {
      return ('Overweight');
    }
    else if (_bmi >= 18.5) {
      return ('Normal');
    }
    else {
      return ('Underweight');
    }
  }

  String giveRecommendation() {
    if (_bmi >= 25) {
      return ('Exercise more!');
    }
    else if (_bmi >= 18.5) {
      return ('Keep doing what you are doing!');
    }
    else {
      return ('Eat more!');
    }
  }

}