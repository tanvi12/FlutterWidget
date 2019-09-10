///  StreamBuilder

import 'package:flutter/material.dart';



class StreamBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Future Builder Example",
      home: Center(
        child: WaitingforSomething(),
      ),
    );
  }
}

class WaitingforSomething extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: "Working . . .",
      stream: _someData(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Center(child: Text(snapshot.data.toString())),
          floatingActionButton: IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () => print(snapshot.data.toString())),
        );
      },
    );
  }
}

Stream<int> _someData() async* {
  yield* Stream.periodic(Duration(seconds: 1), (int a) {
    return a++;
  });
}
