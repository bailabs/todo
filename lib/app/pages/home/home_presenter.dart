import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/usecases/remove_todo_usecase.dart';

class HomePresenter extends Presenter {
  final RemoveTodoUseCase removeTodoUseCase;
  HomePresenter(todosRepo): removeTodoUseCase = RemoveTodoUseCase(todosRepo);

  void remove(int id) {
    print('at the presenter $id');
  }

  @override
  void dispose() {
    removeTodoUseCase.dispose();
  }
}