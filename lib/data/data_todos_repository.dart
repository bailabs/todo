import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class DataTodosRepository extends TodosRepository {
  List<Todo> _todos;

  DataTodosRepository._internal() {
    _todos = List<Todo>();
  }

  static DataTodosRepository _instance = DataTodosRepository._internal();
  factory DataTodosRepository() => _instance;

  @override
  void addTodo(Todo todo) => _todos.add(todo);

  @override
  void completeTodo(int id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    if (todo != null) {
      todo.completed = true;
    }
  }

  @override
  int get todosLength => _todos.length;

  @override
  List<Todo> get allTodos => _todos;
}