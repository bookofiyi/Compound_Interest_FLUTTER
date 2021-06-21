import 'package:compund_interest/calculator.dart';
import 'package:compund_interest/components/bottom_button.dart';
import 'package:compund_interest/components/reusable_card.dart';
import 'package:compund_interest/components/round_icon_button.dart';
import 'package:compund_interest/constants.dart';
import 'package:compund_interest/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int rate = 5;
  int time = 3;
  int principal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compound Interest Calc'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter your principal',
                    style: kLabelTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 8, 32.0, 0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        principal = int.parse(value);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              cardColour: Color(0xFF0A0E21),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Interest Rate',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        rate.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        '%',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: rate.toDouble(),
                      min: kMinRate,
                      max: kMaxRate,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          rate = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              cardColour: kCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Length of Time (in years)',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        time.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'years',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            time--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            time++;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                rate: rate,
                principal: principal,
                time: time,
              );

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ResultsPage(
                    compInterest: calc.calculateInterest(),
                    totalAccrued: calc.calculateTotalAccrued(principal),
                    years: time,
                    principal: principal,
                    rate: rate,
                    // currentPrincipal: calc.calculateSimpleInterest(principal),
                  );
                },
              ));
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
