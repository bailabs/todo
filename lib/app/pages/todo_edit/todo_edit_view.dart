import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/data/data_todos_moor_repository.dart';
import 'package:flutter_clean_todo/data/data_todos_repository.dart';
import 'todo_edit_controller.dart';
import 'widgets/todo_edit_form.dart';

class TodoEditView extends View {
  final int id;
  final Function callback;

  TodoEditView({
    @required this.id,
    this.callback,
  }): super();

  @override
  _TodoEditViewState createState() =>
    _TodoEditViewState(TodoEditController(DataTodosMoorRepository(), id));
}

class _TodoEditViewState extends ViewState<TodoEditView, TodoEditController> {
  _TodoEditViewState(TodoEditController controller) : super(controller);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Todo Edit'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            controller.removeTodo(widget.id);
            if (widget.callback != null) {
              widget.callback();
            }
            Navigator.of(context).pop();
          },
        )
      ],
    ),
    body: Container(
      child: TodoEditForm(
        initialValue: controller.title,
        onEdit: (value) {
          controller.editTodo(widget.id, value);
          if (widget.callback != null) {
            widget.callback();
          }
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
