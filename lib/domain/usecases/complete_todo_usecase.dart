import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'package:rxdart/rxdart.dart';

class CompleteTodoUseCase extends CompletableUseCase<CompleteTodoUseCaseParams> {
  final TodosRepository todosRepository;
  CompleteTodoUseCase(this.todosRepository);

  @override
  Future<Observable<void>> buildUseCaseObservable(CompleteTodoUseCaseParams params) async {
    final StreamController<void> controller = StreamController();
    todosRepository.completeTodo(params.id);
    controller.close();
    return Observable(controller.stream);
  }
}

class CompleteTodoUseCaseParams {
  final int id;
  CompleteTodoUseCaseParams(this.id);
}
