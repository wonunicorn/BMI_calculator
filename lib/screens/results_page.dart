import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';

class Page2 extends StatelessWidget {
 Page2({this.bmiResult, this.resultText, this.interpretation});
 final String bmiResult;
 final String resultText;
 final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: kAppBarText,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleStyle,
              ),
            ),
          ),

              Expanded(
              flex: 5,
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          color: kMainIconsColor,
                          fontSize: 60.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kMainIconsColor,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


          Expanded(
            child: bottom_button(
              onPressed: (){
                Navigator.pop(context);
              },
              title: 'RE CALCULATE',
            ),
          ),
        ],
      ),
    );
  }
}
