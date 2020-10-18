import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xffEb1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatColor(GenderType.MALE);
                      });
                    },
                    child: ReusableCard(
                      colour: maleColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        title: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatColor(GenderType.FEMALE);
                    });
                  },
                  child: ReusableCard(
                    colour: femaleColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      title: "Female",
                    ),
                  ),
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: activeCardColor,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(child: ReusableCard(colour: activeCardColor)),
                Expanded(child: ReusableCard(colour: activeCardColor)),
              ],
            )),
            Container(
              color: bottomContainerColor,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
            )
          ],
        ));
  }

  Color maleColor = inActiveCardColor;
  Color femaleColor = inActiveCardColor;
  updatColor(GenderType gender) {
    switch (gender) {
      case GenderType.MALE:
        maleColor = activeCardColor;
        femaleColor = inActiveCardColor;
        break;
      case GenderType.FEMALE:
        femaleColor = activeCardColor;
        maleColor = inActiveCardColor;
    }
  }
}

enum GenderType { MALE, FEMALE }
