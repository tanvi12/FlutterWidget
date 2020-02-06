import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class CountModel extends InheritedModel<String> {
  final int count;
  final String text;

  CountModel({this.count,this.text, child}) : super(child: child);

  @override
  bool updateShouldNotify(CountModel oldWidget) {
    if (oldWidget.count != count ) {
      return true;
    }
    return false;
  }

  @override
  bool updateShouldNotifyDependent(
      InheritedModel<String> oldWidget, Set<String> dependencies) {
    if (dependencies.contains('counter')) {
      return true;
    }
    return false;
  }

  static CountModel of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<CountModel>(context, aspect: aspect);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: Theme.of(context),
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Counter"),
          ),
      body:
          CountModel(
            count: count,
              text: "Hey theree",
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ const CounterText(),  const CounterText2()],
                ),
              ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              setState(() {
                ++count;
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
              });
            },
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText();

  @override
  Widget build(BuildContext context) {
    CountModel model = CountModel.of(context, 'counter');
    return Text(
      'Count: ${model.count}',
      style: TextStyle(color: RandomColor().randomColor(),fontSize: 30),
    );
  }
}

class CounterText2 extends StatelessWidget {
  const CounterText2();

  @override
  Widget build(BuildContext context) {
    CountModel model = CountModel.of(context, 'text');
    return Text(
      '${model.text}',
      style: TextStyle(color: RandomColor().randomColor(),fontSize: 30),
    );
  }
}
