import 'package:flutter_todo/todo/todo.dart';

class TodosState {
  final List<Todo> todos;

  const TodosState({this.todos});

  factory TodosState.initial() => TodosState(todos: [
        Todo(0, isChecked: true, text: 'Feed the dog'),
        Todo(1, isChecked: false, text: 'Shop'),
      ]);
}
