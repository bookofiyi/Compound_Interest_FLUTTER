import 'package:auto_size_text/auto_size_text.dart';
import 'package:compund_interest/calculator.dart';
import 'package:flutter/material.dart';
import 'package:compund_interest/constants.dart';
import 'package:compund_interest/components/reusable_card.dart';
import 'package:compund_interest/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.compInterest,
      @required this.years,
      @required this.totalAccrued,
      this.principal,
      this.rate});

  final String compInterest;
  final int years;
  final String totalAccrued;
  final int principal;
  final int rate;

  @override
  Widget build(BuildContext context) {
    CalculatorBrain calc =
        CalculatorBrain(principal: principal, rate: rate, time: years);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Compound Interest'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCard(
              cardColour: kCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: AutoSizeText(
                        'Your Compound Interest is ₦$compInterest',
                        style: kResultsTextStyle,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AutoSizeText(
                      'At the end of $years year(s), your money would\'ve grown to be ₦$totalAccrued',
                      style: kResultsTextStyle,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                    ),
                  ),
                  AutoSizeText(
                    'Yr   |   Principal    |    Gained Interest ($rate%)   |   Total Accrued',
                    style: kPrincipalTextStyle,
                    textAlign: TextAlign.center,
                    minFontSize: 8.0,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    '---------------------------------------------------------------------------------------------',
                    style: kPrincipalTextStyle,
                    textAlign: TextAlign.center,
                    minFontSize: 10.0,
                    maxLines: 1,
                  ),
                  calc.drawTable(principal.toDouble(), rate)
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
