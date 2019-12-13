import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'moor/database.dart';
import 'moor/mobile.dart';

class DataTodosMoorRepository extends TodosRepository {
  Database _moor;

  DataTodosMoorRepository._internal() {
    _moor = Mobile().constructDb();
  }

  static DataTodosMoorRepository _instance = DataTodosMoorRepository._internal();
  factory DataTodosMoorRepository() => _instance;

  @override
  void addTodo(Todo todo) async {
    final id = await _moor.addTodo(todo);
    print('Created with an id $id');
  }

  @override
  // TODO: implement allTodos
  List<Todo> get allTodos => null;

  @override
  void completeTodo(int id) {
    // TODO: implement completeTodo
  }

  @override
  void editTodo(int id, String title) {
    // TODO: implement editTodo
  }

  @override
  Todo getTodo(int id) {
    // TODO: implement getTodo
    return null;
  }

  @override
  void removeTodo(int id) {
    // TODO: implement removeTodo
  }

  @override
  // TODO: implement todosLength
  int get todosLength => null;

}
