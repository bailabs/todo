import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/app/pages/home/home_presenter.dart';
import 'package:flutter_clean_todo/data/data_todos_repository.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  final DataTodosRepository repository;

  HomeController(this.repository): presenter = HomePresenter(repository), super();

  List<Todo> get todoList => this.repository.allTodos;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void completeTodo(Map<String, dynamic> params) {
    int id = params['id'];
    print(id);
  }

  void removeTodo(Map<String, dynamic> params) {
    int id = params['id'];
    this.presenter.remove(id);
  }

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}
