import 'package:bloc/bloc.dart';
import 'package:flutter_todo/todo/todo.dart';
import 'package:flutter_todo/todo/todos_event.dart';
import 'package:flutter_todo/todo/todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  void onAdd(Todo todo) {
    dispatch(AddTodoEvent(todo));
  }

  void onDelete(String key) {
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
      _currentState.todos.removeWhere((todo) => todo.key == event.key);
      yield TodosState(todos: _currentState.todos);
    } else if (event is UpdateTodoEvent) {
      var i =
          _currentState.todos.indexWhere((todo) => todo.key == event.todo.key);
      _currentState.todos.removeAt(i);
      _currentState.todos.insertAll(i, [
        Todo(
          event.todo.key,
          text: event.todo.text,
          isChecked: event.todo.isChecked,
        )
      ]);
      yield TodosState(todos: _currentState.todos);
    }
  }
}
