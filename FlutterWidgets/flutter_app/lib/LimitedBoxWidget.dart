import 'package:flutter/material.dart';
import 'dart:math' as math;
class LimitedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for(int i=0;i<10;i++)
            LimitedBox(
              maxHeight: 200,
              child: Container(color: getRandomColor(),),
            )
        ],
      ),
    );
  }

  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
}
