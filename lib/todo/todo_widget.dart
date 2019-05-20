import 'package:flutter/material.dart';
import 'package:flutter_todo/todo/todo.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;

  TodoWidget(this.todo);

  @override
  _TodoWidgetState createState() => _TodoWidgetState(todo);
}

class _TodoWidgetState extends State<TodoWidget> {
  final Todo todo;

  _TodoWidgetState(this.todo);

  void _checkChanged(bool value) => setState(() => todo.isChecked = value);
  void _textChanged(String value) => setState(() => todo.text = value);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(1),
        child: Row(children: <Widget>[
          Checkbox(value: todo.isChecked, onChanged: _checkChanged),
          Flexible(
            fit: FlexFit.tight,
            child: todo.isChecked
                ? Text(
                    todo.text,
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 16),
                  )
                : TextField(
                    decoration:
                        InputDecoration.collapsed(hintText: "Enter task"),
                    controller: TextEditingController(text: todo.text),
                    onSubmitted: _textChanged,
                  ),
          ),
          Visibility(
              visible: false,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ))
        ]));
  }
}
