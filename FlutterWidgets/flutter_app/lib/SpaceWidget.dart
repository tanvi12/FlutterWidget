import 'package:flutter/material.dart';

class SpaceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.red,
            ),
          ),
          Spacer(flex: 1,),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.green,
            ),
          ),
          Spacer(flex: 2,),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.cyan,
            ),
          )
        ],
      ),
    );
  }
}
