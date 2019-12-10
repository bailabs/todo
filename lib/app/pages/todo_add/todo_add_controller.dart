import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';

import './todo_add_presenter.dart';

class TodoAddController extends Controller {
  TodoAddPresenter addPresenter;
  TodoAddController(todosRepo)
      : addPresenter = TodoAddPresenter(todosRepo),
        super();

  @override
  void initListeners() {
    addPresenter.addTodoOnComplete = () {
      print('todo is added');
    };

    addPresenter.addTodoOnError = () {
      print('could not add item');
      refreshUI();
    };
  }

  void addTodo(String title) {
    addPresenter.addTodo(Todo(
      title: title,
    ));
  }

  @override
  void dispose() {
    addPresenter.dispose();
    super.dispose();
  }
}
