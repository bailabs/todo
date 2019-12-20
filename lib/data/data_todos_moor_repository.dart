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

  static DataTodosMoorRepository _instance =
      DataTodosMoorRepository._internal();
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
    return _todos;
  }

  @override
  completeTodo(int id) async {
    await _moor.completeTodo(id);
  }

  @override
  editTodo(int id, String title) async {
    await _moor.editTodo(id, title);
  }

  @override
  getTodo(int id) async {
    final todo = await _moor.getTodo(id);
    return mapTodoEntryToTodo(todo);
  }

  @override
  removeTodo(int id) async {
    await _moor.deleteTodo(id);
  }

  @override
  // TODO: implement todosLength
  int get todosLength => null;
}
