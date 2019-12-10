import '../entities/todo.dart';

abstract class TodosRepository {
  void addTodo(Todo todo);
  void completeTodo(int id);
  int get todosLength;
  List<Todo> get allTodos;
}
