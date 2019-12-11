import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/app/pages/home/home_presenter.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  final TodosRepository todosRepository;

  List<Todo> _todos;
  List<Todo> get todoList => _todos;

  HomeController(this.todosRepository):
    presenter = HomePresenter(todosRepository) {
    _todos = List<Todo>();
    initListeners();
    loadOnStart();
    retrieveData();
  }

  @override
  void initListeners() {
    presenter.getAllTodosOnNext = (List<Todo> todos) {
      _todos = todos;
      refreshUI();
    };
  }

  void completeTodo(Map<String, dynamic> params) => this.presenter.complete(params['id']);
  void removeTodo(Map<String, dynamic> params) => this.presenter.remove(params['id']);
  void retrieveData() {
    this.presenter.getAll();
  }

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}
