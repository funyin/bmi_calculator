import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
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
                Expanded(child: ReusableCard(colour: activeCardColor)),
                Expanded(child: ReusableCard(colour: activeCardColor)),
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
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
      child: cardChild,
    );
  }
}

// Column(
// children: [
// Row(
// children: [
// Expanded(
// child: Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xff1c1b2b),
// borderRadius: BorderRadius.circular(10)),
// height: 200,
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xff1c1b2b),
// borderRadius: BorderRadius.circular(10)),
// height: 200,
// width: 170,
// ),
// )
// ],
// ),
// Row(
// children: [
// Expanded(
// child: Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xff1c1b2b),
// borderRadius: BorderRadius.circular(10)),
// height: 200,
// width: 170,
// ),
// )
// ],
// ),
// Row(
// children: [
// Expanded(
// child: Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xff1c1b2b),
// borderRadius: BorderRadius.circular(10)),
// height: 200,
// width: 170,
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xff1c1b2b),
// borderRadius: BorderRadius.circular(10)),
// height: 200,
// width: 170,
// ),
// )
// ],
// )
// ],
// ));
