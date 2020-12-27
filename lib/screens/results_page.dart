import 'package:flutter/material.dart';
import 'package:compund_interest/constants.dart';
import 'package:compund_interest/components/reusable_card.dart';
import 'package:compund_interest/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.compInterest});

  final String compInterest;

  @override
  Widget build(BuildContext context) {
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
                    'Your Compount Interest is ₦$compInterest',
                    style: kResultsTextStyle,
                    textAlign: TextAlign.center,
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
