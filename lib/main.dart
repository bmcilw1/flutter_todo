import 'package:flutter/material.dart';
import 'package:flutter_todo/todo/todo.dart';
import 'package:flutter_todo/todo/todo_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// TODO: Refactor constants into InheritedWidget to share constant state
  final title = 'Flutter TODO Tracker';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;

  MyHomePage(this.title);

  @override
  State<StatefulWidget> createState() => _MyHomePageState(title);
}

// TODO: Implement BLOC pattern to house List of todos
class _MyHomePageState extends State<MyHomePage> {
  final title;
  List<Widget> todos = [];

  _MyHomePageState(this.title);

  void _addTodo() {
    setState(() {
      todos.add(TodoWidget(Todo(2)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: todos,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}
