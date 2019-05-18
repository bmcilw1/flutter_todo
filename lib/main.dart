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

class MyHomePage extends StatelessWidget {
  final title;

  MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Todo(isChecked: true, text: 'Feed the dog'),
            Todo(isChecked: false, text: 'Shop')
          ],
        ));
  }
}
