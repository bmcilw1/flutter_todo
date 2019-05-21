import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/todo/todo.dart';
import 'package:flutter_todo/todo/todo_bloc.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  TodoWidget(this.todo);

  @override
  Widget build(BuildContext context) {
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
                    controller: TextEditingController(text: todo.text),
                    onSubmitted: (value) =>
                        BlocProvider.of<TodosBloc>(context).onUpdate(Todo(
                          todo.key,
                          isChecked: todo.isChecked,
                          text: value,
                        )),
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
}
