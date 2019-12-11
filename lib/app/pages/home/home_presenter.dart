import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/usecases/remove_todo_usecase.dart';

class HomePresenter extends Presenter {
  final RemoveTodoUseCase removeTodoUseCase;
  HomePresenter(todosRepo): removeTodoUseCase = RemoveTodoUseCase(todosRepo);

  void remove(int id) {
    removeTodoUseCase.execute(_RemoveTodoObserver(this), RemoveTodoUseCaseParams(id));
  }

  @override
  void dispose() {
    removeTodoUseCase.dispose();
  }
}

class _RemoveTodoObserver implements Observer<void> {
  final HomePresenter presenter;

  _RemoveTodoObserver(this.presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    // TODO: implement onError
  }

  @override
  void onNext(ignore) {
    // TODO: implement onNext
  }
}