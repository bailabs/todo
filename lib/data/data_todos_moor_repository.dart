import 'package:flutter_clean_todo/data/mappers/todo_mapper.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'moor/database.dart';
import 'moor/mobile.dart';

class DataTodosMoorRepository extends TodosRepository {
  Database _moor;
  List<Todo> _todos;

  DataTodosMoorRepository._internal() {
    _todos = [];
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
  get allTodos async {
    final List<TodoEntry> todos = await _moor.allTodos;
    _todos = mapTodoEntriesToTodos(todos);
    print(_todos);
    return _todos;
  }

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
