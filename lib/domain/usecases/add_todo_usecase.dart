import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../entities/todo.dart';
import '../repositories/todos_repository.dart';

class AddTodoUseCase
    extends UseCase<AddTodoUseCaseResponse, AddTodoUseCaseParams> {
  TodosRepository todosRepository;

  AddTodoUseCase(this.todosRepository);

  @override
  Future<Stream<AddTodoUseCaseResponse>> buildUseCaseStream(
      AddTodoUseCaseParams params) async {
    final StreamController<AddTodoUseCaseResponse> controller =
        StreamController();
    try {
      if (params.todo.title == null || params.todo.title == "") {
        throw 'Title should not be blank!';
      } else {
        params.todo.id = todosRepository.todosLength;
        params.todo.completed = false;
        todosRepository.addTodo(params.todo);
        controller.add(AddTodoUseCaseResponse(params.todo));
        logger.finest('AddTodoUseCase successful.');
      }
      controller.close();
    } catch (e) {
      logger.severe('AddTodoUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

/// Wrapping params inside an object makes it easier to change later
class AddTodoUseCaseParams {
  final Todo todo;

  AddTodoUseCaseParams(this.todo);
}

/// Wrapping response inside an object makes it easier to change later
class AddTodoUseCaseResponse {
  final Todo todo;

  AddTodoUseCaseResponse(this.todo);
}
