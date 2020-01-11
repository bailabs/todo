import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class RemoveTodoUseCase extends CompletableUseCase<RemoveTodoUseCaseParams> {
  final TodosRepository todosRepository;
  RemoveTodoUseCase(this.todosRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(
      RemoveTodoUseCaseParams params) async {
    final StreamController<void> controller = StreamController();
    controller.add(await todosRepository.removeTodo(params.id));
    controller.close();
    return controller.stream;
  }
}

class RemoveTodoUseCaseParams {
  final int id;
  RemoveTodoUseCaseParams(this.id);
}
