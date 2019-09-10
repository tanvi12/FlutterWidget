import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class InheritedWidgetExample extends StatefulWidget {
  @override
  _InheritedWidgetExampleState createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  int accountId = 0;
  int scopeId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPage(accountId, scopeId),
      floatingActionButton: FloatingActionButton(onPressed: () {
        accountId++;
        scopeId++;
      }),
    );
  }
}

class MyPage extends StatelessWidget {
  final int accountId;
  final int scopeId;

  MyPage(this.accountId, this.scopeId);

  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: new MyWidget(),
      accountId: accountId,
      scopeId: scopeId,
    );
  }
}

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    // somewhere down the line
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Scope Id ${MyInheritedWidget.of(context).scopeId}"),
        new MyOtherWidget(),
      ],
    ));
  }
}

class MyOtherWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    // somewhere down the line
    return Center(
        child: Text("Account Id ${MyInheritedWidget.of(context).accountId}"));
  }
}

class MyInheritedWidget extends InheritedWidget {
  final int accountId;
  final int scopeId;

  const MyInheritedWidget({
    Key key,
    @required this.accountId,
    @required this.scopeId,
    @required Widget child,
  })  : assert(accountId != null),
        assert(scopeId != null),
        assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return accountId != oldWidget.accountId || scopeId != oldWidget.scopeId;
  }

  static MyInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyInheritedWidget);
  }

}

///////

class MyModel {
  const MyModel({this.accountId = 0, this.scopeId = 1});

  final int accountId;
  final int scopeId;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final MyModel otherModel = other;
    return otherModel.accountId == accountId || otherModel.scopeId == scopeId;
  }

  @override
  int get hashCode => (scopeId.hashCode + accountId.hashCode);
}

class _ModelBindingScope<T> extends InheritedModel<int> {
  const _ModelBindingScope({Key key, this.modelBindingState, Widget child})
      : super(key: key, child: child);

  final _ModelBindingState<T> modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;

  @override
  bool updateShouldNotifyDependent(InheritedModel<int> oldWidget, Set<int> dependencies) {
    return dependencies.contains(2);
  }

}

class ModelBinding<T> extends StatefulWidget {
  ModelBinding({
    Key key,
    @required this.initialModel,
    this.child,
  })  : assert(initialModel != null),
        super(key: key);

  final T initialModel;
  final Widget child;

  _ModelBindingState<T> createState() => _ModelBindingState<T>();

  static Type _typeOf<T>() =>
      T; // https://github.com/dart-lang/sdk/issues/33297

  static T of<T>(BuildContext context) {
    final Type scopeType = _typeOf<_ModelBindingScope<T>>();
    final _ModelBindingScope<T> scope =
        context.inheritFromWidgetOfExactType(scopeType,aspect: 1);
    return scope.modelBindingState.currentModel;
  }

  static void update<T>(BuildContext context, T newModel) {
    final Type scopeType = _typeOf<_ModelBindingScope<T>>();
    final _ModelBindingScope<dynamic> scope =
        context.inheritFromWidgetOfExactType(scopeType,aspect: 1);
    scope.modelBindingState.updateModel(newModel);
  }
}

class _ModelBindingState<T> extends State<ModelBinding<T>> {
  T currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(T newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope<T>(
      modelBindingState: this,
      child: widget.child,
    );
  }
}

class ViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final MyModel model = ModelBinding.of<MyModel>(context);
          ModelBinding.update<MyModel>(
              context,
              MyModel(
                  scopeId: model.scopeId + 1, accountId: model.accountId + 1));
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Text(
                    'ScopeId ${ModelBinding.of<MyModel>(context).scopeId}',style: TextStyle(color: RandomColor().randomColor()),)),
            Text('AccountId ${ModelBinding.of<MyModel>(context).accountId}',style: TextStyle(color: RandomColor().randomColor()),),
          ],
        ),
      ),
    );
  }
}

class MutableInheritedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModelBinding<MyModel>(
        initialModel: const MyModel(),
        child: Scaffold(
          body: Center(
            child: ViewController(),
          ),
        ),
      ),
    );
  }
}
