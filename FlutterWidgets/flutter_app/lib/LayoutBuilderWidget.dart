import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatefulWidget {
  @override
  _LayoutBuilderWidgetState createState() => _LayoutBuilderWidgetState();
}

class _LayoutBuilderWidgetState extends State<LayoutBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
          if (constrains.maxWidth > 600) {
            return Center(child: Text("Horizontal"));
          }else{
            return Center(
              child: Text("Vertical"),
            );
          }
        },
      ),
    );
  }
}
