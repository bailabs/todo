import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'package:rxdart/rxdart.dart';

class RemoveTodoUseCase extends UseCase<void, RemoveTodoUseCaseParams> {
  TodosRepository todosRepository;
  RemoveTodoUseCase(this.todosRepository);

  @override
  Future<Observable<void>> buildUseCaseObservable(RemoveTodoUseCaseParams params) {
    todosRepository.removeTodo(params.id);
    return null;
  }
}

class RemoveTodoUseCaseParams {
  final int id;
  RemoveTodoUseCaseParams(this.id);
}
