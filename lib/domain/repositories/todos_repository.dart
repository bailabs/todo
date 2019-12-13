import '../entities/todo.dart';

abstract class TodosRepository {
  void addTodo(Todo todo);
  void editTodo(int id, String title);
  void completeTodo(int id);
  void removeTodo(int id);
  Todo getTodo(int id);
  int get todosLength;
  get allTodos;
}
