class Todo {
  int id;
  String title;
  bool completed;
  Todo({this.id, this.title, this.completed});

  @override
  String toString() => '($id, $title, $completed)';
}
