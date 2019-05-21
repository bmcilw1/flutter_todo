import 'package:flutter_todo/todo/todo.dart';
import 'package:uuid/uuid.dart';

class TodosState {
  final List<Todo> todos;

  const TodosState({this.todos});

  factory TodosState.initial() {
    var uuid = Uuid();
    return TodosState(todos: [
      Todo(uuid.v4(), isChecked: true, text: 'Feed the dog'),
      Todo(uuid.v4(), isChecked: false, text: 'Shop'),
    ]);
  }
}
