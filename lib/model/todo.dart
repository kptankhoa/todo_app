class ToDo {
  int id;
  String title;
  DateTime toDoTime;
  bool isDone;

  ToDo({
    required this.id,
    required this.title,
    required this.toDoTime,
    this.isDone = false,
  });

  void setDone() => isDone = true;

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'toDoTime': toDoTime.toIso8601String(),
        'isDone': isDone ? 1 : 0,
      };

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'toDoTime': toDoTime.toIso8601String(),
        'isDone': isDone
      };

  ToDo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        toDoTime = DateTime.parse(json['toDoTime']),
        isDone = json['isDone'];
}
