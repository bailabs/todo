import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_clean_todo/domain/repositories/todos_repository.dart';
import 'todo_edit_presenter.dart';

class TodoEditController extends Controller {
  final TodoEditPresenter presenter;

  TodoEditController(TodosRepository todosRepo) :
    presenter = TodoEditPresenter(todosRepo),
    super()
  ;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void removeTodo(int id) => this.presenter.remove(id);

}
