import '../entities/todo.dart';

abstract class TodosRepository {
  addTodo(Todo todo);
  editTodo(int id, String title);
  completeTodo(int id);
  removeTodo(int id);
  getTodo(int id);
  int get todosLength;
  get allTodos;
}
