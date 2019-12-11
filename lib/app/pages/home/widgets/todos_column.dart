import 'package:flutter/material.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'todo_card.dart';

class TodosColumn extends StatelessWidget {
  final List<Todo> data;
  final Function(int) onPressed;
  final Function(int) onLongPressed;

  TodosColumn({
    @required this.data,
    @required this.onPressed,
    @required this.onLongPressed,
  });

  List<Widget> dataToWidgets() {
    return data.map((todo) =>
      TodoCard(
        title: todo.title,
        completed: todo.completed,
        onTap: () => this.onPressed(todo.id),
        onLongPress: () => this.onLongPressed(todo.id),
      )
    ).toList();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: dataToWidgets(),
  );
}
