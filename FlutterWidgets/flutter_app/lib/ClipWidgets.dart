import 'package:flutter/material.dart';

class ClipWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ),
        ClipOval(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ),
        ClipPath(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
