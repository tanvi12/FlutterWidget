import 'package:flutter/material.dart';

class TransformWidget extends StatefulWidget {
  @override
  _TransformWidgetState createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  double sliderVal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderVal = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: sliderVal,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Slider(
              value: sliderVal,
              min: 0.0,
              max: 100.0,
              onChanged: (val) {
                setState(() {
                  sliderVal = val;
                });
              },
            ),
            Container(
              child: Transform.rotate(
                angle: sliderVal,
                origin: Offset(0.0, 0.0),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              child: Transform.scale(
                scale: sliderVal==0?1:sliderVal/10,
                origin: Offset(0.0, 0.0),
                child: Container(
                  height:sliderVal/10,
                  width: sliderVal/10,
                  color: Colors.green,
                ),
              ),
            ),
            Container(
              child: Transform.translate(
                offset: Offset(sliderVal,10),
                child: Container(
                  height:100,
                  width: 100,
                  color: Colors.amber,
                ),
              ),
            ),
            Container(
              child: Transform(
                transform: Matrix4.skewX(sliderVal/100),
                child: Container(
                  height:100,
                  width: 100,
                  color: Colors.black38,
                ),
              ),
            ),
            Container(
              child: Transform(
                transform: Matrix4.identity()..setEntry(3, 2, sliderVal/1000)..rotateX(3.14/20.0),
                child: Container(
                  height:100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
