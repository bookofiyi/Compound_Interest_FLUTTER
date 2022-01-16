import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalculatorBrain {
  CalculatorBrain({this.principal, this.rate, this.time});

  final int rate;
  final int time;
  int principal;

  double _compInterest;
  // double _currentPrincipal;
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

  // Widget calculateSimpInterest(int i, int initialPrincipal, int rate) {
  //   double _interest = (initialPrincipal * rate * 1) / 100;
  //   double _accrued = _interest + initialPrincipal;
  //   String totalAccrued = _accrued.toStringAsFixed(2);
  //   String gainedInterest = _interest.toStringAsFixed(2);
  //   return Column(
  //     children: [
  //       Text(
  //         '$i   |    ₦$initialPrincipal         |         ₦$gainedInterest        |        ₦$totalAccrued\n---------------------------------------------------------------------------------------------',
  //         style: kPrincipalTextStyle,
  //         textAlign: TextAlign.center,
  //       ),
  //     ],
  //   );
  // }

  int getTotalAccrued() {
    return totalAccrued;
  }

  Widget drawTable(double tempAccrued, int rate) {
    // tempAccrued is implying the principal here
    List<Widget> rows = []; // This creates an empty List to accommodate each
    // row of principal breakdown table

    // this is calculating the simple interest for each year
    for (int i = 1; i <= time; i++) {
      double _interest = (this.principal * rate * 1) / 100;
      String theInterest = _interest.toStringAsFixed(2);
      double anotherTempAccrued = _interest + this.principal;
      int principal = this.principal;
      this.principal = anotherTempAccrued.toInt();

      String accrued = anotherTempAccrued.toStringAsFixed(2);
      rows.add(
        AutoSizeText(
          '$i   |    ₦$principal         |         ₦$theInterest       |         ₦$accrued\n---------------------------------------------------------------------------------------------',
          style: kPrincipalTextStyle,
          textAlign: TextAlign.center,
          minFontSize: 8.0,
          maxLines: 2,
        ),
      );
    }

    // return ListView.builder(
    //   padding: const EdgeInsets.all(8),
    //   itemCount: rows.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       // height: 50,
    //       child: Center(child: Text('$rows')),
    //     );
    //   },
    // );

    return Expanded(
      child: ListView(children: rows),
    );
  }
}
