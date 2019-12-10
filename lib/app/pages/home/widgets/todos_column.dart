import 'package:flutter/material.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'todo_card.dart';

class TodosColumn extends StatelessWidget {
  final List<Todo> data;
  final Function(int) onPressed;

  TodosColumn({@required this.data, @required this.onPressed});

  List<Widget> dataToWidgets() {
    return data.map((todo) =>
      TodoCard(
        title: todo.title,
        completed: todo.completed,
        onTap: () => this.onPressed(todo.id),
      )
    ).toList();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: dataToWidgets(),
  );
}
