import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class GetAllTodosUseCase extends UseCase<List<Todo>, void> {
  final TodosRepository todosRepository;
  GetAllTodosUseCase(this.todosRepository);
  @override
  Future<Observable<List<Todo>>> buildUseCaseObservable(void params) {
    final StreamController<List<Todo>> controller = StreamController();
    controller.add(todosRepository.allTodos);
    controller.close();
    return Future<Observable<List<Todo>>>.value(Observable(controller.stream));
  }
}
