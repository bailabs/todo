import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/usecases/edit_todo_usecase.dart';
import 'package:flutter_clean_todo/domain/usecases/remove_todo_usecase.dart';

class TodoEditPresenter extends Presenter {
  final RemoveTodoUseCase removeTodoUseCase;
  final EditTodoUseCase editTodoUseCase;

  TodoEditPresenter(todosRepo):
    removeTodoUseCase = RemoveTodoUseCase(todosRepo),
    editTodoUseCase = EditTodoUseCase(todosRepo)
  ;

  void remove(int id) {
    removeTodoUseCase.execute(_RemoveTodoObserver(), RemoveTodoUseCaseParams(id));
  }

  void edit(int id, String title) {
    editTodoUseCase.execute(_EditTodoObserver(), EditTodoUseCaseParams(id, title));
  }

  @override
  void dispose() {
    removeTodoUseCase.dispose();
  }
}

class _RemoveTodoObserver implements Observer<void> {
  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    // TODO: implement onError
  }

  @override
  void onNext(void response) {
    // TODO: implement onNext
  }
}

class _EditTodoObserver implements Observer<void> {
  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    // TODO: implement onError
  }

  @override
  void onNext(void response) {
    // TODO: implement onNext
  }
}
