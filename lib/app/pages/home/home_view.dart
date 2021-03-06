import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/app/pages/todo_add/todo_add_view.dart';
import 'package:flutter_clean_todo/app/pages/todo_edit/todo_edit_view.dart';
import 'package:flutter_clean_todo/data/data_todos_repository.dart';

import 'home_controller.dart';
import 'widgets/todos_column.dart';

class HomeView extends View {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState() : super(HomeController(DataTodosRepository()));

  @override
  Widget buildPage() => Scaffold(
        appBar: AppBar(title: Text('Home')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => TodoAddView(
                callback: controller.retrieveData,
              ),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: TodosColumn(
              data: controller.todoList,
              onLongPressed: (value) => controller.completeTodo(
                {'id': value},
              ),
              onPressed: (value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => TodoEditView(
                    id: value,
                    callback: controller.retrieveData,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
