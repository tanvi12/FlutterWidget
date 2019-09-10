import 'package:flutter/material.dart';

class DismissedWidget extends StatefulWidget {
  DismissedWidget({Key key}) : super(key: key);

  @override
  DismissedWidgetState createState() {
    return DismissedWidgetState();
  }
}

class DismissedWidgetState extends State<DismissedWidget> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Swipe to Dismiss';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          // Create a ListView
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                // Specify the direction to swipe and delete
                direction: DismissDirection.horizontal,
                key: Key(item),
                onDismissed: (direction) {
                  // Removes that item the list on swipwe
                  setState(() {
                    items.removeAt(index);
                  });
                  // Shows the information on Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed")));
                },
                background: Container(color: Colors.red),
                secondaryBackground: Container(color: Colors.amber,),
                child: ListTile(title: Text('$item')),
              );
            },
          )),
    );
  }
}