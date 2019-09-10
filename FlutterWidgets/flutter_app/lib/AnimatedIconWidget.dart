
import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  bool mReverse = false;

  @override
  void initState() {
    super.initState();
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
              onTap: () {
                if (mReverse == false)
                  animationController.forward();
                else
                  animationController.reverse();

                  mReverse = !mReverse;

              },
              child: AnimatedIcon(
                size: 100,
                progress: animation,
                icon: AnimatedIcons.close_menu,
              ),
        ),
      ),
    );
  }
}
