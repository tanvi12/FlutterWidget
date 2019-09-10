import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BackdropFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new Stack(
          children: <Widget>[
            new ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: new FlutterLogo()),
            new Center(
        //      child: new ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    child: FlutterLogo(),
                  ),
                ),
              ),
//            ),
          ],
        ),
      ),
    );
  }
}
