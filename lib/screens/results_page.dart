import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'file:///C:/Users/DELL/AndroidStudioProjects/Tuts/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final resultText;
  final bmi;
  final interpretation;

  const Results({Key key, this.resultText, this.bmi, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your Results',
                textAlign: TextAlign.center,
                style: kLabelTextStyleLarge,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: kLabelTextStyleLarge.copyWith(
                        fontSize: 18, color: Colors.green),
                  ),
                  SizedBox(
                    width: double.infinity,
                  ),
                  Text(
                    bmi,
                    style: kLabelTextStyleLarge.copyWith(fontSize: 80),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: kBottomContainerHeight,
              color: kBottomContainerColor,
              child: Text(
                'Re-Calculate',
                style: kLabelTextStyleLarge.copyWith(fontSize: 24.0),
              ),
              width: double.infinity,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }
}
