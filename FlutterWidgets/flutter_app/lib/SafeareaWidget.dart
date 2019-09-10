import 'package:flutter/material.dart';

class SafeareadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        width: 100,
        child: Text("Hello world"),
      ),
    );
  }
}
