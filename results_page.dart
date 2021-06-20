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
  int principal;
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
                  Text(
                    'Your Compound Interest is ₦$compInterest',
                    style: kResultsTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'At the end of $years year(s), your total money would\'ve grown to be ₦$totalAccrued',
                    style: kResultsTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Expanded(
                      //         flex: 0,
                      //         child: Text(
                      //           'Yr',
                      //           style: kPrincipalTextStyle,
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         flex: 1,
                      //         child: Text(
                      //           'Principal',
                      //           style: kPrincipalTextStyle,
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 2,
                      //         child: Text(
                      //           'Gained Interest ($rate%)',
                      //           style: kPrincipalTextStyle,
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 1,
                      //         child: Text(
                      //           'Total Accrued',
                      //           style: kPrincipalTextStyle,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Text(
                        'Yr   |   Principal    |    Gained Interest ($rate%)   |   Total Accrued',
                        style: kPrincipalTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '---------------------------------------------------------------------------------------------',
                        style: kPrincipalTextStyle,
                        textAlign: TextAlign.center,
                      ),

                      calc.drawTable(principal.toDouble(), rate)

                      // for (int i = 1; i <= years; i++)
                      //   {
                      //     calc.calculateSimpInterest(i, principal, rate),
                      //     principal = calc.getTotalAccrued(),
                      //   }

                      // Text(
                      //   'By the end of Year $i, you will have a total of ₦$currentPrincipal',
                      //   style: kPrincipalTextStyle,
                      // ),
                    ],
                  ),
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
