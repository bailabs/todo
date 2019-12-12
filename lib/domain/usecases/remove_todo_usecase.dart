import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'package:rxdart/rxdart.dart';

class RemoveTodoUseCase extends CompletableUseCase<RemoveTodoUseCaseParams> {
  final TodosRepository todosRepository;
  RemoveTodoUseCase(this.todosRepository);

  @override
  Future<Observable<void>> buildUseCaseObservable(RemoveTodoUseCaseParams params) async {
    final StreamController<void> controller = StreamController();
    todosRepository.removeTodo(params.id);
    controller.close();
    return Observable(controller.stream);
  }
}

class RemoveTodoUseCaseParams {
  final int id;
  RemoveTodoUseCaseParams(this.id);
}
