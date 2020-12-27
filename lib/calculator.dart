import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.principal, this.rate, this.time});

  final int rate;
  final int time;
  final int principal;

  double _compInterest;

  String calculateInterest() {
    _compInterest = principal * (pow(1 + (rate / 100), time) - 1);
    return _compInterest.toStringAsFixed(1);
  }
}
