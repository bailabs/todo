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

  Future<int> addTodo(Todo todo) => into(todos)
    .insert(
      TodosCompanion(
        title: Value(todo.title),
        completed: Value(todo.completed),
      )
    );
}
