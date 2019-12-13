import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class GetAllTodosUseCase extends UseCase<List<Todo>, void> {
  final TodosRepository todosRepository;
  GetAllTodosUseCase(this.todosRepository);
  @override
  Future<Observable<List<Todo>>> buildUseCaseObservable(void params) async {
    final StreamController<List<Todo>> controller = StreamController();
    controller.add(await todosRepository.allTodos);
    controller.close();
    return Observable(controller.stream);
  }
}
