import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: FractionalOffset(0.5, 0.3),
          child: Column(
            children: <Widget>[
              SizedBox(height: 90,),
              new Container(
                width: 200,
                height: 200,
                decoration: new BoxDecoration(
                    border: new Border.all(
                        color: Colors.green,
                        width: 5.0,
                        style: BorderStyle.solid
                    ),
                    image: new DecorationImage(
                      image: new AssetImage('assets/download.jpeg'),
                    )
                ),
              ),
              SizedBox(height: 20,),
              new Container(
                width: 200,
                height: 200,

                decoration: new BoxDecoration(
                    border: new Border(
                      top: new BorderSide(
                          color: Colors.green,
                          width: 5.0,
                          style: BorderStyle.solid
                      ),
                    ),
                    image: new DecorationImage(
                      image: new AssetImage('assets/download.jpeg'),
                    ),
                ),
              ),
              new Container(
                width: 200,
                height: 200,
                decoration: new BoxDecoration(
                    border: new BorderDirectional(
                      top: new BorderSide(
                          color: Colors.green,
                          width: 5.0,
                          style: BorderStyle.solid
                      ),
                      start: new BorderSide(
                          color: Colors.green,
                          width: 5.0,
                          style: BorderStyle.solid
                      ),
                    ),
                    image: new DecorationImage(
                      image: new AssetImage('assets/download.jpeg'),
                    )
                ),
              ),
            ],
          ),

      ),
    );
  }
}
