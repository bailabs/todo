import 'package:flutter/material.dart';

class TodoAddForm extends StatefulWidget {
  final Function(String) onAdd;

  TodoAddForm({@required this.onAdd});

  @override
  TodoAddFormState createState() => TodoAddFormState();
}

class TodoAddFormState extends State<TodoAddForm> {
  final _key = GlobalKey<FormState>();
  String _title = '';

  @override
  Widget build(BuildContext context) => Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) => _title = value,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Input is required';
                }
                return null;
              },
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                if (_key.currentState.validate()) {
                  widget.onAdd(_title);
                }
              },
            ),
          ],
        ),
      );
}
