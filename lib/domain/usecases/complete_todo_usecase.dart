import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'package:rxdart/rxdart.dart';

class CompleteTodoUseCase extends UseCase<void, CompleteTodoUseCaseParams> {
  final TodosRepository todosRepository;
  CompleteTodoUseCase(this.todosRepository);

  @override
  Future<Observable<void>> buildUseCaseObservable(CompleteTodoUseCaseParams params) {
    todosRepository.completeTodo(params.id);
    return null;
  }
}

class CompleteTodoUseCaseParams {
  final int id;
  CompleteTodoUseCaseParams(this.id);
}
