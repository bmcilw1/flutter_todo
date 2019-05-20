import 'package:flutter/material.dart';
import 'package:flutter_todo/todo/todo.dart';
import 'package:flutter_todo/todo/todo_bloc.dart';
import 'package:flutter_todo/todo/todo_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/todo/todos_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// TODO: Refactor constants into InheritedWidget to share constant state
  final title = 'TODO Tracker';

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

class MyHomePage extends StatefulWidget {
  final title;

  MyHomePage(this.title, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  final title;
  final _todosBloc = TodosBloc();

  _MyHomePageState(this.title);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _todosBloc,
      child: TodosWidget(widget: widget),
    );
  }

  @override
  void dispose() {
    _todosBloc.dispose();
    super.dispose();
  }
}

class TodosWidget extends StatelessWidget {
  const TodosWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
          bloc: BlocProvider.of<TodosBloc>(context),
          builder: (context, TodosState state) {
            return Column(
              children: [for (var todo in state.todos) TodoWidget(todo)],
            );
          }),
      floatingActionButton: BlocBuilder(
          bloc: BlocProvider.of<TodosBloc>(context),
          builder: (context, TodosState state) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => BlocProvider.of<TodosBloc>(context)
                  .onAdd(Todo(state.todos.length)),
            );
          }),
    );
  }
}
