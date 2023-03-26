class Todo {
  late String title;
  late bool completed;

  Todo({
    required this.title,
    this.completed = false,
  });

  Todo.fromMap(Map map) : 
  title = map['title'],
  completed = map['completed'];

  Map toMap() {
    return {
      'title': title,
      'completed': completed
    };
  }
}