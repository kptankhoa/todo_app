class ToDo {
  int id;
  String title;
  DateTime todoTime;
  bool isDone;
  ToDo({required this.id, required this.title, required this.todoTime, this.isDone = false});
  void setDone() => isDone = true;
}