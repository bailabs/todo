import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:moor/moor.dart';
part 'database.g.dart';

@DataClassName('TodoEntry')
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(max: 32)();
  BoolColumn get completed => boolean()();
}

@UseMoor(tables: [Todos])
class Database extends _$Database {

  @override
  int get schemaVersion => 1;

  Database(QueryExecutor e) : super(e);

  Future<List<TodoEntry>> get allTodos => select(todos).get();
  Future<TodoEntry> getTodo(int id) => (select(todos)..where((todo) => todo.id.equals(id))).getSingle();
  Future<int> deleteTodo(int id) => (delete(todos)..where((todo) => todo.id.equals(id))).go();

  Future editTodo(int id, String title) => (update(todos)..where((todo) => todo.id.equals(id))).write(
    TodosCompanion(title: Value(title))
  );

  Future completeTodo(int id) => (update(todos)..where((todo) => todo.id.equals(id))).write(
    TodosCompanion(completed: Value(true))
  );

  Future<int> addTodo(Todo todo) => into(todos)
    .insert(
      TodosCompanion(
        title: Value(todo.title),
        completed: Value(todo.completed),
      )
    );
}
