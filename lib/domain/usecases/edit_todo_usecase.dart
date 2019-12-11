import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'package:rxdart/rxdart.dart';

class EditTodoUseCase extends UseCase<void, EditTodoUseCaseParams> {
  final TodosRepository todosRepository;
  EditTodoUseCase(this.todosRepository);

  @override
  Future<Observable<void>> buildUseCaseObservable(params) {
    todosRepository.editTodo(params.id, params.title);
    return null;
  }

}

class EditTodoUseCaseParams {
  final int id;
  final String title;
  EditTodoUseCaseParams(this.id, this.title);
}
