import 'package:flutter/material.dart';


class Option2 extends StatefulWidget {
  @override
  _Option2State createState() => _Option2State();
}

class _Option2State extends State<Option2> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: -350).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(animation: animation, builder: (BuildContext context, Widget chile){
              return Transform.translate(
                offset: Offset(0, animation.value),
                child: Container(
                  height: 250,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/download.jpeg'),
                      )),
                ),
              );
            }),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: RaisedButton(
              onPressed: () {
                animationController.forward();
              },
              child: Text('Go'),
              color: Colors.red,
              textColor: Colors.yellowAccent,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}


class Option4 extends StatefulWidget {
  @override
  _Option4State createState() => _Option4State();
}

class _Option4State extends State<Option4> with TickerProviderStateMixin {

  double _ironManAlignment = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            bottom: _ironManAlignment,
            left: 90,
            child: Container(
              height: 250,
              width: 150,
              child: Image.asset('assets/download.jpeg'),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: RaisedButton(
              onPressed: () {
                _flyIronMan();
              },
              child: Text('Go'),
              color: Colors.red,
              textColor: Colors.yellowAccent,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          )
        ],
      ),
    );
  }

  void _flyIronMan() {
    setState(() {
      _ironManAlignment = 320;
    });
  }

}


class Option5 extends StatefulWidget {
  @override
  _Option5State createState() => _Option5State();
}

class _Option5State extends State<Option5> with TickerProviderStateMixin {

  AlignmentDirectional _ironManAlignment = AlignmentDirectional(0.0, 0.7);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/download.jpeg'),
                  fit: BoxFit.cover)),
        ),
        AnimatedContainer(
          duration: Duration(seconds: 3),
          alignment: _ironManAlignment,
          child: Container(
            height: 250,
            width: 150,
            child: Image.asset('assets/download.jpeg'),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: RaisedButton(
            onPressed: () {
              _flyIronMan();
            },
            child: Text('Go'),
            color: Colors.red,
            textColor: Colors.yellowAccent,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        )
      ],
    );
  }

  void _flyIronMan() {
    setState(() {
      _ironManAlignment = AlignmentDirectional(0.0,-0.7);
    });
  }

}
