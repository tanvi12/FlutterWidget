import 'package:flutter/material.dart';

class PageviewWidget extends StatefulWidget {
  @override
  _PageviewWidgetState createState() => _PageviewWidgetState();
}

class _PageviewWidgetState extends State<PageviewWidget> {
  PageController controller;
  var currentPageValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
    currentPageValue = 0.0;
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

//    return PageView(
//      children: <Widget>[
//        Container(
//          color: Colors.pink,
//        ),
//        Container(
//          color: Colors.cyan,
//        ),
//        Container(
//          color: Colors.deepPurple,
//        ),
//      ],
//    );

//    return PageView.builder(itemBuilder: (context, position) {
//      return Container(
//        color: position % 2 == 0 ? Colors.pink : Colors.cyan,
//      );
//    },itemCount: 3,scrollDirection: Axis.vertical, pageSnapping: false,);
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, position) {

        if (position == currentPageValue.floor()) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                child: Text(
                  "Page",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          );
        } else if (position == currentPageValue.floor() + 1){
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                child: Text(
                  "Page",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          );
        } else {
          debugPrint("else $position + $currentPageValue");
          return Container(
            color: position % 2 == 0 ? Colors.blue : Colors.pink,
            child: Center(
              child: Text(
                "Page",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
          );
        }
      },
      itemCount: 10,
    );

  }
}
