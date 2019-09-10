import 'package:flutter/material.dart';

class AlignmentTweenWidget extends StatefulWidget {
  @override
  _AlignmentTweenWidgetState createState() => _AlignmentTweenWidgetState();
}

class _AlignmentTweenWidgetState extends State<AlignmentTweenWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  double _value = 100;
  Alignment _alignmentValue = Alignment(0.0, 1.0);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this,
        lowerBound: 100.0,
        upperBound: 300.0);

    _animation = AlignmentTween(
      begin: Alignment.center,
      end: Alignment.center,
    ).animate(_animationController);

    _animation.addListener(() {
      setState(() {
        _value = _animationController.value;
        _alignmentValue = _animation.value;
        debugPrint(
            'AnimationController Value: ${_animationController.value} \n Animation Value: ${_animation.value}');
      });
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
        ),
        body: Container(
          height: 300,
          width: 300,
          alignment: _alignmentValue,
          child: Image(
            width: _value,
            height: _value,
            image: AssetImage('assets/download.jpeg'),
          ),
        ));
  }
}
