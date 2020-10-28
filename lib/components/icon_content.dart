import 'package:flutter/material.dart';
import '../constants.dart';

class iconContent extends StatelessWidget {
  iconContent({this.iconType, this.textIcon});
  final IconData iconType;
  final String textIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconType,
          size: 80.0,
          color: kMainIconsColor,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          textIcon,
          style: kTextStyle,
        ),
      ],

    );
  }
}
