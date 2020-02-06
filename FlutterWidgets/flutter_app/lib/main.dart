import 'package:flutter/material.dart';
import 'package:flutter_app/SafeareaWidget.dart';
import 'AbsorbPointer.dart';
import 'AlignWidget.dart';
import 'AlignmentTween.dart';
import 'AnimatedBuilder.dart';
import 'AnimatedIconWidget.dart';
import 'AnimatedListWidget.dart';
import 'AnimationContainedWidget.dart';
import 'AspectRatioWidget.dart';
import 'BackDropFilterWidget.dart';
import 'BottomNavigationBar.dart';
import 'ClipWidgets.dart';
import 'DismissedWidget.dart';
import 'DraggableWidget.dart';
import 'FadeInImageWidget.dart';
import 'FittedBoxWidget.dart';
import 'FlexibleWidget.dart';
import 'InheritedModelExample.dart';
import 'InheritedWidgetExample.dart';
import 'LayoutBuilderWidget.dart';
import 'LimitedBoxWidget.dart';
import 'PageviewWidget.dart';
import 'SizeboxWidget.dart';
import 'SliverAppBarWidget.dart';
import 'SliverGridWidget.dart';
import 'SliverListWidget.dart';
import 'SpaceWidget.dart';
import 'StreamBuilderWidget.dart';
import 'TableWidget.dart';
import 'TransformWidget.dart';
import 'ValueListableBuilder.dart';
import 'WrapWidget.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}

