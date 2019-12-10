import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';

import '../../../domain/usecases/add_todo_usecase.dart';

class TodoAddPresenter extends Presenter {
  Function addTodoOnNext;
  Function addTodoOnComplete;
  Function addTodoOnError;

  AddTodoUseCase addTodoUseCase;

  TodoAddPresenter(todosRepo) : addTodoUseCase = AddTodoUseCase(todosRepo);

  void addTodo(Todo todo) {
    addTodoUseCase.execute(
        _AddTodoUseCaseObserver(this), AddTodoUseCaseParams(todo));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    addTodoUseCase.dispose();
  }
}

class _AddTodoUseCaseObserver extends Observer<AddTodoUseCaseResponse> {
  TodoAddPresenter presenter;
  _AddTodoUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.addTodoOnComplete != null);
    presenter.addTodoOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.addTodoOnError != null);
    presenter.addTodoOnError(e);
  }

  @override
  void onNext(response) {}
}
