import 'package:flutter/material.dart';

class SizeBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          SizedBox.expand(
            child: RaisedButton(
              onPressed: (){},
              color: Colors.amber,
            ),
//            height: 200,
//            width: 200,
      ),
    );
  }
}
