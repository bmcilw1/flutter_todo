import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/todo/todo.dart';
import 'package:flutter_todo/todo/todo_bloc.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;

  TodoWidget(this.todo, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoWidgetState(todo);
}

class _TodoWidgetState extends State<TodoWidget> {
  //final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final Todo todo;

  _TodoWidgetState(this.todo);

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = todo.text;

    return Container(
        padding: EdgeInsets.all(1),
        child: Row(children: <Widget>[
          Checkbox(
              value: todo.isChecked,
              onChanged: (value) =>
                  BlocProvider.of<TodosBloc>(context).onUpdate(Todo(
                    todo.key,
                    isChecked: value,
                    text: todo.text,
                  ))),
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
                    controller: _textEditingController,
                    // focusNode: _focusNode,
                    onSubmitted: (value) {
                        todo.text = value;
                        BlocProvider.of<TodosBloc>(context).onUpdate(Todo(
                          todo.key,
                          isChecked: todo.isChecked,
                          text: value,
                        ));
                    }
                  ),
          ),
          Visibility(
              visible: true,
              child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () =>
                      BlocProvider.of<TodosBloc>(context).onDelete(todo.key)))
        ]));
  }

/*
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      /*
      BlocProvider.of<TodosBloc>(context).onUpdate(Todo(
        todo.key,
        isChecked: todo.isChecked,
        text: _textEditingController.text,
      ));
      */
    });
  }
  */

  @override
  void dispose() {
    //_focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }
}
