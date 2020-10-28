import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/round_button.dart';
import '../components/bottom_button.dart';
import '../calculator_bmi.dart';

enum gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 74;
  int age = 19;

  gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = gender.male;
                    });
                  },
                  colour: selectedGender == gender.male
                      ? kActiveCardColor
                      : kInactivatedColor,
                  cardChild: iconContent(
                    iconType: FontAwesomeIcons.mars,
                    textIcon: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = gender.female;
                    });
                  },
                  colour: selectedGender == gender.female
                      ? kActiveCardColor
                      : kInactivatedColor,
                  cardChild: iconContent(
                    iconType: FontAwesomeIcons.venus,
                    textIcon: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: kInactivatedColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //TODO: What is this?
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kIconStyle,
                    ),
                    Text(
                      'cm',
                      style: kTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: kMainIconsColor,
                    inactiveTrackColor: kActiveCardColor,
                    thumbColor: Colors.pink,
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(

                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    //newValue  ---> the value that will be passed to us from the slider when the slider gets changed by the user
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kInactivatedColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kIconStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            iconButton: Icons.remove,
                            pressedFunc: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            iconButton: Icons.add,
                            pressedFunc: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
              ),
              Expanded(
                child: ReusableCard(colour: kInactivatedColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kIconStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            iconButton: Icons.remove,
                            pressedFunc: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            iconButton: Icons.add,
                            pressedFunc: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),

                        ],
                      ),
                    ],
                  ),),
              ),
            ],
          ),
        ),
        bottom_button(
          onPressed: () {

            Calculator calc = Calculator(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Page2(
                  bmiResult: calc.calculateBmi(),
                  interpretation: calc.getInterpretation(),
                  resultText: calc.getResult(),
              );
            }));
          },
          title: 'CALCULATE',
        ),
      ],
    );
  }
}


