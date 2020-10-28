import 'package:flutter/material.dart';
import '../constants.dart';


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.iconButton, this.pressedFunc});
  final IconData iconButton;
  final Function pressedFunc;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0, // shadow from button
      child: Icon(
        iconButton,
        color: kMainIconsColor,
        size: 30.0,
      ),
      onPressed: pressedFunc,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kActiveCardColor,
    );
  }
}
