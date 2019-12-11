import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'todo_edit_controller.dart';
import 'widgets/todo_edit_form.dart';

class TodoEditView extends View {
  @override
  _TodoEditViewState createState() =>
    _TodoEditViewState(TodoEditController());
}

class _TodoEditViewState extends ViewState<TodoEditView, TodoEditController> {
  _TodoEditViewState(TodoEditController controller) : super(controller);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Todo Edit')),
    body: Container(
      child: TodoEditForm(onEdit: (value) => print(value)),
    ),
  );
}
