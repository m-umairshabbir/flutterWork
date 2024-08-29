import 'dart:math';

class CalculationBrain {
  CalculationBrain({required this.height, required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;
  late final double _bmi;

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Try to maintain your diet plan to look smarter.";
    } else if (_bmi > 18.5) {
      return "Great job, you are smart!";
    } else {
      return "Eat healthy food to regain your health.";
    }
  }
}
