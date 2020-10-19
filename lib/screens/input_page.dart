import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'file:///C:/Users/DELL/AndroidStudioProjects/Tuts/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height = 120;
int weight = 60;
int age = 60;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: maleColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      title: "Male",
                    ),
                    onPressed: () {
                      setState(() {
                        updatColor(GenderType.MALE);
                      });
                    },
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colour: femaleColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    title: "Female",
                  ),
                  onPressed: () {
                    setState(() {
                      updatColor(GenderType.FEMALE);
                    });
                  },
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kLabelTextStyleLarge,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        thumbColor: kBottomContainerColor,
                        inactiveTrackColor: Colors.grey,
                        overlayColor: kBottomContainerColor.withAlpha(0x29),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        onChangeStart: (value) {},
                        min: 120.0,
                        max: 220.0),
                  )
                ],
              ),
              onPressed: null,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kLabelTextStyleLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _RoundIconButton(
                            mChild: FontAwesomeIcons.minus,
                            function: () {
                              setState(() {
                                weight == 0 ? weight = 0 : weight--;
                              });
                            },
                          ),
                          _RoundIconButton(
                            mChild: FontAwesomeIcons.plus,
                            function: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  onPressed: null,
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kLabelTextStyleLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _RoundIconButton(
                            mChild: FontAwesomeIcons.minus,
                            function: () {
                              setState(() {
                                age == 0 ? age = 0 : age--;
                              });
                            },
                          ),
                          _RoundIconButton(
                            mChild: FontAwesomeIcons.plus,
                            function: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calcBrain =
                    CalculatorBrain(weight: weight, height: height);

                // Navigator.pushNamed(context, kRouteResults,
                //     arguments: calcBrain);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Results(
                    bmi: calcBrain.calculateBMI(),
                    resultText: calcBrain.getResults(),
                    interpretation: calcBrain.getInterpretation(),
                  );
                }));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Calculate',
                  style: kLabelTextStyleLarge.copyWith(fontSize: 24.0),
                ),
                color: kBottomContainerColor,
                height: kBottomContainerHeight,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10.0),
              ),
            )
          ],
        ));
  }

  Color maleColor = kActiveCardColor;
  Color femaleColor = kInActiveCardColor;
  updatColor(GenderType gender) {
    maleColor =
        gender == GenderType.MALE ? kActiveCardColor : kInActiveCardColor;
    femaleColor =
        gender == GenderType.FEMALE ? kActiveCardColor : kInActiveCardColor;
  }
}

class _RoundIconButton extends StatelessWidget {
  final mChild;
  final Function function;

  const _RoundIconButton({@required this.mChild, this.function});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      child: Icon(mChild),
      fillColor: Colors.grey.withAlpha(0x29),
    );
  }
}

enum GenderType { MALE, FEMALE }
