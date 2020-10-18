import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

class IconContent extends StatelessWidget {
  final String title;
  final IconData icon;

  IconContent({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(
          title,
          style: labelTextStyle,
        )
      ],
    );
  }
}
