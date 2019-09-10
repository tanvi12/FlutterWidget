import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Tooltip(
            message: 'FlutterLogo',
            child: FlutterLogo(
              size: 100,
            )),
      ),
    ));
  }
}
