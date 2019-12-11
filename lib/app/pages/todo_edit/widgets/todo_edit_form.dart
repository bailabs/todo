import 'package:flutter/material.dart';

class TodoEditForm extends StatefulWidget {
  final String initialValue;
  final Function(String) onEdit;

  TodoEditForm({
    @required this.onEdit,
    this.initialValue,
  });

  @override
  TodoEditFormState createState() => TodoEditFormState();
}

class TodoEditFormState extends State<TodoEditForm> {
  final _key = GlobalKey<FormState>();
  String _title = '';

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue.isEmpty) {
      return CircularProgressIndicator();
    }
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: widget.initialValue,
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
              child: Text('Edit'),
              onPressed: () {
                if (_key.currentState.validate()) {
                  widget.onEdit(_title);
                }
              }
          ),
        ],
      ),
    );
  }
}