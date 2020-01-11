import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class CompleteTodoUseCase
    extends CompletableUseCase<CompleteTodoUseCaseParams> {
  final TodosRepository todosRepository;
  CompleteTodoUseCase(this.todosRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(
      CompleteTodoUseCaseParams params) async {
    final StreamController<void> controller = StreamController();
    controller.add(await todosRepository.completeTodo(params.id));
    controller.close();
    return controller.stream;
  }
}

class CompleteTodoUseCaseParams {
  final int id;
  CompleteTodoUseCaseParams(this.id);
}
