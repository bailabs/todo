import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
//import 'package:flutter_clean_todo/data/data_todos_repository.dart';
import 'package:flutter_clean_todo/data/data_todos_moor_repository.dart';

import 'todo_add_controller.dart';
import 'widgets/todo_add_form.dart';

class TodoAddView extends View {
  final Function callback;

  TodoAddView({this.callback}) : super();

  @override
  _TodoAddViewState createState() =>
      _TodoAddViewState(TodoAddController(DataTodosMoorRepository()));
}

class _TodoAddViewState extends ViewState<TodoAddView, TodoAddController> {
  _TodoAddViewState(TodoAddController controller) : super(controller);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Todo Add')),
        body: Container(
          child: TodoAddForm(
            onAdd: (value) {
              controller.addTodo(value);
              if (widget.callback != null) {
                widget.callback();
              }
              Navigator.of(context).pop();
            },
          ),
        ),
      );
}
