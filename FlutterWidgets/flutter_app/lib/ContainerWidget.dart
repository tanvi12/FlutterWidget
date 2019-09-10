import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 200,
          maxWidth: 200,
          minHeight: 100,
          minWidth: 100
        ),
        height: 200,
        width: 200,
        child: Text("Hello"),
        alignment: Alignment.center,
        transform:Matrix4.rotationZ(0.1),
        foregroundDecoration: BoxDecoration(
          color: Colors.black38
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [BoxShadow(
            color: Colors.white,
            spreadRadius: 10.0,
            blurRadius: 10.0
          )]
        ),
      ),
    );
  }
}
