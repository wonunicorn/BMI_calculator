import 'package:flutter/material.dart';
import '../constants.dart';

class bottom_button extends StatelessWidget {
  bottom_button({this.onPressed, this.title});
  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(

        child: Center(
          child: Text( title,
            style: kTextBottomButton,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: Colors.pink,
      ),
    );
  }
}
