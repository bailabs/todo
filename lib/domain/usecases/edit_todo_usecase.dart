import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class EditTodoUseCase extends CompletableUseCase<EditTodoUseCaseParams> {
  final TodosRepository todosRepository;
  EditTodoUseCase(this.todosRepository);
  @override
  Future<Stream<void>> buildUseCaseStream(EditTodoUseCaseParams params) async {
    final StreamController<void> controller = StreamController();
    controller.add(await todosRepository.editTodo(params.id, params.title));
    controller.close();
    return controller.stream;
  }
}

class EditTodoUseCaseParams {
  final int id;
  final String title;
  EditTodoUseCaseParams(this.id, this.title);
}
