import 'package:flutter/material.dart';
import 'todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

class _MyHomePageState extends State<MyHomePage> {
  final title;
  List<Widget> todos = [
    Todo(isChecked: true, text: 'Feed the dog'),
    Todo(isChecked: false, text: 'Shop')
  ];

  _MyHomePageState(this.title);

  void _addTodo() {
    setState(() {
      todos.add(Todo(text: "", isChecked: false,));
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
