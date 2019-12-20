import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';
import 'package:flutter_clean_todo/domain/usecases/edit_todo_usecase.dart';
import 'package:flutter_clean_todo/domain/usecases/get_todo_usecase.dart';
import 'package:flutter_clean_todo/domain/usecases/remove_todo_usecase.dart';

class TodoEditPresenter extends Presenter {
  final RemoveTodoUseCase removeTodoUseCase;
  final EditTodoUseCase editTodoUseCase;
  final GetTodoUseCase getTodoUseCase;

  Function getTodoOnNext;

  TodoEditPresenter(todosRepo)
      : removeTodoUseCase = RemoveTodoUseCase(todosRepo),
        editTodoUseCase = EditTodoUseCase(todosRepo),
        getTodoUseCase = GetTodoUseCase(todosRepo);

  void remove(int id) {
    removeTodoUseCase.execute(
        _RemoveTodoObserver(), RemoveTodoUseCaseParams(id));
  }

  void edit(int id, String title) {
    editTodoUseCase.execute(
        _EditTodoObserver(), EditTodoUseCaseParams(id, title));
  }

  void get(int id) {
    getTodoUseCase.execute(_GetTodoObserver(this), id);
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

class _GetTodoObserver implements Observer<Todo> {
  final TodoEditPresenter presenter;
  _GetTodoObserver(this.presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    // TODO: implement onError
  }

  @override
  void onNext(Todo response) {
    presenter.getTodoOnNext(response);
  }
}
