import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/app/pages/home/home_presenter.dart';
import 'package:flutter_clean_todo/data/data_todos_repository.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  final TodosRepository todosRepository;

  HomeController(this.todosRepository):
    presenter = HomePresenter(todosRepository),
    super()
  ;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  List<Todo> get todoList => this.todosRepository.allTodos;
  void completeTodo(Map<String, dynamic> params) => this.presenter.complete(params['id']);
  void removeTodo(Map<String, dynamic> params) => this.presenter.remove(params['id']);

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}
