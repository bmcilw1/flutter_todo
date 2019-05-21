import 'package:bloc/bloc.dart';
import 'package:flutter_todo/todo/todo.dart';
import 'package:flutter_todo/todo/todos_event.dart';
import 'package:flutter_todo/todo/todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  void onAdd(Todo todo) {
    dispatch(AddTodoEvent(todo));
  }

  void onDelete(int key) {
    dispatch(DeleteTodoEvent(key));
  }

  void onUpdate(Todo todo) {
    dispatch(UpdateTodoEvent(todo));
  }

  @override
  TodosState get initialState => TodosState.initial();

  @override
  Stream<TodosState> mapEventToState(
    TodosState currentState,
    TodosEvent event,
  ) async* {
    final TodosState _currentState = currentState;

    if (event is AddTodoEvent) {
      _currentState.todos.add(Todo(
        event.todo.key,
        text: event.todo.text,
        isChecked: event.todo.isChecked,
      ));
      yield TodosState(todos: _currentState.todos);
    } else if (event is DeleteTodoEvent) {
      _currentState.todos.removeAt(event.key);
      yield TodosState(todos: _currentState.todos);
    } else if (event is UpdateTodoEvent) {
      _currentState.todos.removeAt(event.todo.key);
      _currentState.todos.add(Todo(
        event.todo.key,
        text: event.todo.text,
        isChecked: event.todo.isChecked,
      ));
      _currentState.todos.sort((a, b) => a.key.compareTo(b.key));
      yield TodosState(todos: _currentState.todos);
    }
  }
}
