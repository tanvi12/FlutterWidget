import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomPainterWidget extends StatefulWidget {
  @override
  _CustomPainterWidgetState createState() => _CustomPainterWidgetState();
}

class MyPainter extends CustomPainter{
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter({this.lineColor,this.completeColor,this.completePercent,this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );
    double arcAngle = 2*pi* (completePercent/100);
    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -pi,
        arcAngle,
        false,
        complete
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _CustomPainterWidgetState extends State<CustomPainterWidget> with SingleTickerProviderStateMixin{
  double percentage = 0.0;
  double newPercentage = 0.0;
  AnimationController percentageAnimationController;

  @override
  void initState() {
    super.initState();
    percentageAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 1000)
    )
      ..addListener((){
        setState(() {
          percentage = lerpDouble(percentage,newPercentage,percentageAnimationController.value);
        });
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: new CustomPaint(
            foregroundPainter: MyPainter(lineColor: Colors.amber,
                completeColor: Colors.blueAccent,
                completePercent: percentage,
                width: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    percentage = newPercentage;
                    newPercentage += 10;
                    if(newPercentage>100.0){
                      percentage=0.0;
                      newPercentage=0.0;
                    }
                    percentageAnimationController.forward(from: 0.0);
                  });
                },
                color: Colors.blue,
                shape: CircleBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
