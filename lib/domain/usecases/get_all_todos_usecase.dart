import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class GetAllTodosUseCase extends UseCase<List<Todo>, void> {
  final TodosRepository todosRepository;
  GetAllTodosUseCase(this.todosRepository);
  @override
  Future<Stream<List<Todo>>> buildUseCaseStream(void params) async {
    final StreamController<List<Todo>> controller = StreamController();
    controller.add(await todosRepository.allTodos);
    controller.close();
    return controller.stream;
  }
}
