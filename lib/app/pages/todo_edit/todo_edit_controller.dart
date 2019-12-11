import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'todo_edit_presenter.dart';

class TodoEditController extends Controller {
  final TodoEditPresenter presenter;

  String _title;
  String get title => _title;

  TodoEditController(TodosRepository todosRepo, int id) :
    presenter = TodoEditPresenter(todosRepo) {
    _title = '';
    initListeners();
    loadOnStart();
    retrieveData(id);
  }

  @override
  void initListeners() {
    presenter.getTodoOnNext = (Todo todo) {
      _title = todo.title;
      refreshUI();
    };
  }

  void removeTodo(int id) => this.presenter.remove(id);
  void editTodo(int id, String title) => this.presenter.edit(id, title);
  void retrieveData(int id) => this.presenter.get(id);

}
