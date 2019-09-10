import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Wrap(
          spacing: 0.0, // gap between adjacent chips
          runSpacing: 0.0,
          direction: Axis.vertical,// gap between lines
          children: <Widget>[
            chipDesign("Food", Color(0xFF4fc3f7)),
            chipDesign("Lifestyle", Color(0xFFffb74d)),
            chipDesign("Health", Color(0xFFff8a65)),
            chipDesign("Sports", Color(0xFF9575cd)),
            chipDesign("Nature", Color(0xFF4db6ac)),
            chipDesign("Fashion", Color(0xFFf06292)),
            chipDesign("Heritage", Color(0xFFa1887f)),
            chipDesign("City Life", Color(0xFF90a4ae)),
            chipDesign("Entertainment", Color(0xFFba68c8)),
          ],
        ),
      ),
    );
  }

  Widget chipDesign(String label, Color color) => Container(
    child: Chip(
      label: Text(
        label,
        style: TextStyle(
            color: Colors.white),
      ),
      backgroundColor: color,
      elevation: 4,
      shadowColor: Colors.grey[50],
      padding: EdgeInsets.all(4),
    ),
    margin: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
  );

}
