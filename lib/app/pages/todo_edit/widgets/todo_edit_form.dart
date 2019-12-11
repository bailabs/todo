import 'package:flutter/material.dart';

class TodoEditForm extends StatefulWidget {
  final Function(String) onEdit;

  TodoEditForm({@required this.onEdit});

  @override
  TodoEditFormState createState() => TodoEditFormState();
}

class TodoEditFormState extends State<TodoEditForm> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Form(
    key: _key,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: 'Title'),
        ),
        RaisedButton(
          child: Text('Edit'),
          onPressed: () => widget.onEdit('test'),
        ),
      ],
    ),
  );
}