import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/usecases/complete_todo_usecase.dart';
import 'package:flutter_clean_todo/domain/usecases/get_all_todos_usecase.dart';
import 'package:flutter_clean_todo/domain/entities/todo.dart';

class HomePresenter extends Presenter {
  final CompleteTodoUseCase completeTodoUseCase;
  final GetAllTodosUseCase getAllTodosUseCase;

  Function getAllTodosOnNext;
  Function completeOnNext;

  HomePresenter(todosRepo):
    completeTodoUseCase = CompleteTodoUseCase(todosRepo),
    getAllTodosUseCase = GetAllTodosUseCase(todosRepo)
  ;

  void complete(int id) {
    completeTodoUseCase.execute(_CompleteTodoObserver(this), CompleteTodoUseCaseParams(id));
  }

  void getAll() {
    getAllTodosUseCase.execute(_GetAllTodosObserver(this), {});
  }

  @override
  void dispose() {
    completeTodoUseCase.dispose();
    getAllTodosUseCase.dispose();
  }
}

class _CompleteTodoObserver implements Observer<void> {
  final HomePresenter presenter;
  _CompleteTodoObserver(this.presenter);

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

class _GetAllTodosObserver implements Observer<List<Todo>> {
  final HomePresenter presenter;
  _GetAllTodosObserver(this.presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    // TODO: implement onError
  }

  @override
  void onNext(List<Todo> response) {
    presenter.getAllTodosOnNext(response);
  }

}
