import 'package:flutter/material.dart';


class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
          ),
          Align(
            alignment: Alignment.center,
            child:  Text("Hello",style: TextStyle(fontSize: 40.0,color: Colors.white),),
          ),
          Align(
            alignment: Alignment(0,0.5),
            child:  Text("Hello1",style: TextStyle(fontSize: 40.0,color: Colors.white),),
          ),
          Positioned(
            top: 40,
            left: 30,
            child:  Text("Hello2",style: TextStyle(fontSize: 40.0,color: Colors.white),),
          )
        ],
      ),
    );
  }
}