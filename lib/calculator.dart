import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'constants.dart';

class CalculatorBrain {
  CalculatorBrain({this.principal, this.rate, this.time});

  final int rate;
  final int time;
  int principal;

  double _compInterest;
  double _currentPrincipal;
  double _totalAccrued;
  int totalAccrued;

  String calculateInterest() {
    _compInterest = principal * (pow(1 + (rate / 100), time) - 1);
    return _compInterest.toStringAsFixed(2);
  }

  String calculateTotalAccrued(int value) {
    _totalAccrued = value + _compInterest;
    return _totalAccrued.toStringAsFixed(2);
  }

  Widget calculateSimpInterest(int i, int initialPrincipal, int rate) {
    double _interest = (initialPrincipal * rate * 1) / 100;
    double _accrued = _interest + initialPrincipal;
    String totalAccrued = _accrued.toStringAsFixed(2);
    String gainedInterest = _interest.toStringAsFixed(2);
    return Column(
      children: [
        Text(
          '$i       ₦$initialPrincipal                  ₦$gainedInterest                ₦$totalAccrued\n---------------------------------------------------------------------------------------------',
          style: kPrincipalTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  int getTotalAccrued() {
    return totalAccrued;
  }

  Widget drawTable(double tempAccrued, int rate) {
    // tempAccrued is implying the principal here
    for (int i = 1; i <= time; i++) {
      principal = tempAccrued.toInt();
      double _interest = (principal * rate * 1) / 100;
      String theInterest = _interest.toStringAsFixed(2);
      tempAccrued = _interest + principal;
      String accrued = tempAccrued.toStringAsFixed(2);
      return Column(
        children: [
          Text(
            '$i       ₦$principal                  ₦$theInterest                ₦$accrued\n---------------------------------------------------------------------------------------------',
            style: kPrincipalTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
    return Text('done');
  }

  // Widget calculateSimpleInterest(int i, int initialPrincipal, int rate) {
  //   _compInterest = initialPrincipal * (pow(1 + (rate / 100), i) - 1);
  //   _currentPrincipal = initialPrincipal + _compInterest;
  //   String temp = _currentPrincipal.toStringAsFixed(2);
  //   return Column(
  //     children: [
  //       Text(
  //         'Year  Principal        Interest ($rate%)      Total Accrued',
  //         style: kPrincipalTextStyle,
  //         textAlign: TextAlign.center,
  //       ),
  //       Text(
  //         '$i     \n---------------------------------',
  //         style: kPrincipalTextStyle,
  //         textAlign: TextAlign.center,
  //       ),
  //     ],
  //   );
  // }
}
