import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/data/moor/database.dart';

Todo mapTodoEntryToTodo(TodoEntry todoEntry) {
  return Todo(
    id: todoEntry.id,
    title: todoEntry.title,
    completed: todoEntry.completed,
  );
}

List<Todo> mapTodoEntriesToTodos(List<TodoEntry> todoEntries) {
  final List<Todo> todoList = List<Todo>();
  todoEntries
      .forEach((todoEntry) => todoList.add(mapTodoEntryToTodo(todoEntry)));
  return todoList;
}
