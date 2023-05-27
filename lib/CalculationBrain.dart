import 'dart:math';

class BMICalculator {
  BMICalculator({required this.height, required this.weight});
  final int height;
  final int weight;
  late double _bmi;
  String calcBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return "normal";
    } else {
      return "underweight";
    }
  }

  String getResultBody() {
    if (_bmi >= 25) {
      return 'You need to do more exercise to reduce weight!';
    } else if (_bmi > 18.5) {
      return "You are doing well. Eat healthy and stay fit!";
    } else {
      return "You need to gain weight so start exercising and eat more to increase weight!";
    }
  }
}
