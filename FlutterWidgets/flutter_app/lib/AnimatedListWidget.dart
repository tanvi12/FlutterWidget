import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedWidgetList extends StatelessWidget {
  const AnimatedWidgetList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic List',
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> items = new List();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  var rng = new Random();

  _addItem() {
    setState(() {
      listKey.currentState
          .insertItem(items.length, duration: const Duration(seconds: 1));
      int id = rng.nextInt(5000);
      items.add(new Item(name: "New Item $id"));
    });
  }

  _removeItem() {
    setState(() {
      int id = rng.nextInt(items.length);
      listKey.currentState.removeItem(
        id,
        (context, animation) => buildItem(context, 0, animation),
        duration: const Duration(milliseconds: 250),
      );
      items.removeAt(id);
    });
  }

  Widget buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      key: ValueKey<int>(index),
      axis: Axis.vertical,
      sizeFactor: animation,
      child: SizedBox(
        child: ListTile(
          title: Text('${items[index].name}'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, Animation<double>> animations = <int, Animation<double>>{};
    return Scaffold(
        appBar: AppBar(
          title: Text("Dynamic List"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _addItem,
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: _removeItem,
            )
          ],
        ),
        body: Directionality(
            textDirection: TextDirection.ltr,
            child: AnimatedList(
              key: listKey,
              initialItemCount: items.length,
              itemBuilder: (context, index, animation) {
                return buildItem(context, index, animation);
              },
            )));
  }
}

class Item {
  Item({this.name});
  String name;
}
