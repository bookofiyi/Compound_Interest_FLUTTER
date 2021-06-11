import 'package:flutter/material.dart';
import 'package:compund_interest/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonStyle,
          ),
        ),
        color: kBottomContainerColour,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 5.0),
        width: double.infinity,
      ),
    );
  }
}
