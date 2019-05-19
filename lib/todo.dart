import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  final isChecked;
  final text;

  Todo({this.isChecked = false, this.text = ''});

  @override
  _TodoState createState() => _TodoState(isChecked, text);
}

class _TodoState extends State<Todo> {
  bool isChecked;
  String text;
  bool showDelete = false;

  _TodoState(this.isChecked, this.text);

  void _checkChanged(bool value) => setState(() => isChecked = value);
  void _textChanged(String value) => setState(() => text = value);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(1),
        child: Row(children: <Widget>[
          Checkbox(value: isChecked, onChanged: _checkChanged),
          Flexible(
            fit: FlexFit.tight,
            child: isChecked
                ? Text(
                    text,
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 16),
                  )
                : TextField(
                    decoration:
                        InputDecoration.collapsed(hintText: "Enter task"),
                    controller: TextEditingController(text: text),
                    onSubmitted: _textChanged,
                  ),
          ),
          Visibility(
              visible: showDelete,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ))
        ]));
  }
}
