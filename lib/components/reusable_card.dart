import 'package:compund_interest/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardChild, this.cardColour});
  final cardChild;
  final cardColour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      decoration: BoxDecoration(
        color: kCardColour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
