import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final bool completed;
  final Function() onTap;

  TodoCard({@required this.title, @required this.onTap, @required this.completed});

  @override
  Widget build(BuildContext context) => Card(
    color: this.completed ? Colors.blue : Colors.white,
    child: InkWell(
      onTap: this.onTap,
      child: Padding(
        padding: EdgeInsets.all(21.0),
        child: Text(this.title),
      )
    )
  );
}