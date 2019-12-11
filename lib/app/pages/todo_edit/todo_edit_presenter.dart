import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/usecases/remove_todo_usecase.dart';

class TodoEditPresenter extends Presenter {
  final RemoveTodoUseCase removeTodoUseCase;
  TodoEditPresenter(todosRepo) : removeTodoUseCase = RemoveTodoUseCase(todosRepo);

  void remove(int id) {
    removeTodoUseCase.execute(_RemoveTodoObserver(), RemoveTodoUseCaseParams(id));
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
