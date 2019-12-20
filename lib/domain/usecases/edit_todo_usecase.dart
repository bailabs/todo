import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'package:rxdart/rxdart.dart';

class EditTodoUseCase extends CompletableUseCase<EditTodoUseCaseParams> {
  final TodosRepository todosRepository;
  EditTodoUseCase(this.todosRepository);
  @override
  Future<Observable<void>> buildUseCaseObservable(
      EditTodoUseCaseParams params) async {
    final StreamController<void> controller = StreamController();
    controller.add(await todosRepository.editTodo(params.id, params.title));
    controller.close();
    return Observable(controller.stream);
  }
}

class EditTodoUseCaseParams {
  final int id;
  final String title;
  EditTodoUseCaseParams(this.id, this.title);
}
