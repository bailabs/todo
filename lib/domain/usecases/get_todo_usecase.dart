import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';

class GetTodoUseCase extends UseCase<Todo, int> {
  final TodosRepository todosRepository;
  GetTodoUseCase(this.todosRepository);
  @override
  Future<Stream<Todo>> buildUseCaseStream(int id) async {
    final StreamController<Todo> controller = StreamController();
    controller.add(await todosRepository.getTodo(id));
    controller.close();
    return controller.stream;
  }
}
