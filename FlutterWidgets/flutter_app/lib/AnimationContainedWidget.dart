import 'package:flutter/material.dart';

//Implicit animation 
class AnimationContainerWidget extends StatefulWidget {
  @override
  _AnimationContainerWidgetState createState() =>
      _AnimationContainerWidgetState();
}

class _AnimationContainerWidgetState extends State<AnimationContainerWidget> {
  var alignment = Alignment.bottomCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        padding: EdgeInsets.all(2.0),
        duration: Duration(seconds: 1),
        alignment: alignment,
        child: Container(
          height: 50.0,
          child: Icon(Icons.airplanemode_active, size: 50.0, color: Colors.blueAccent,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedOpacity(
        duration: Duration(seconds: 10),
        opacity: 0.5,
        child: FloatingActionButton.extended(
            backgroundColor: Colors.blueAccent,
            onPressed: (){
              setState(() {
                alignment = Alignment.center;
              });
            },
            icon: Icon(Icons.airplanemode_active),
            label: Text("Take Flight")),
      ),
    );
  }
}



