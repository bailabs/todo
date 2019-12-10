class Todo {
  int id;
  String title;
  bool completed;
  Todo({this.title});

  @override
  String toString() => '$id, $title, $completed';
}
