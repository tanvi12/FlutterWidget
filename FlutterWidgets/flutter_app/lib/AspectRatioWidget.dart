import 'package:flutter/material.dart';

class AspectRatioWidget extends StatefulWidget {
  @override
  _AspectRatioWidgetState createState() => _AspectRatioWidgetState();
}

class _AspectRatioWidgetState extends State<AspectRatioWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AspectRatio Widget")),
      body: Center(
        child: AspectRatio(
          aspectRatio: 3/1,
          child: Container(height: 50.0, width: 50.0, color: Colors.red),
        ),
      ),
    );
  }
}
