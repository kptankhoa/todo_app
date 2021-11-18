class ToDo {
  int id;
  String title;
  DateTime toDoTime;
  bool isDone;
  ToDo({required this.id, required this.title, required this.toDoTime, this.isDone = false});
  void setDone() => isDone = true;
}