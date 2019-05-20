import './todo.dart';

abstract class TodosEvent {}

class AddTodoEvent extends TodosEvent {
  final Todo todo;

  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodosEvent {
  final int key;

  DeleteTodoEvent(this.key);
}

class UpdateTodoEvent extends TodosEvent {
  final int key;
  final Todo todo;

  UpdateTodoEvent(this.key, this.todo);
}