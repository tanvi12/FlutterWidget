import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: <Widget>[
          SizedBox(height: 40,),
          Center(child: Text("Test1")),
          Expanded(child: Center(child: Text("Tanvi Mandanka"))),
          Expanded(flex:2,child: AboutListTile(child: Text("About",style: TextStyle(color: Colors.black),),)),
        ],
      ),
    );
  }
}

