import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'package:rxdart/src/observables/observable.dart';

class RemoveTodoUseCase extends UseCase<RemoveTodoUseCaseParams, RemoveTodoUseCaseResponse> {
  TodosRepository todosRepository;
  RemoveTodoUseCase(this.todosRepository);

  @override
  Future<Observable<RemoveTodoUseCaseParams>> buildUseCaseObservable(RemoveTodoUseCaseResponse params) {
    return null;
  }
}

class RemoveTodoUseCaseParams {
  final int id;
  RemoveTodoUseCaseParams(this.id);
}

class RemoveTodoUseCaseResponse {
  final Todo todo;
  RemoveTodoUseCaseResponse(this.todo);
}