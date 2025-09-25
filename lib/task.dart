class Task {
  String id;
  String title;
  bool isDone;

  Task(String? id, {required this.title, this.isDone = false})
      : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
      

  Map<String, dynamic> toMap() => {'id': id, 'title': title, 'isDone': isDone};

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(map['id'], title: map['title'], isDone: map['isDone'] ?? false);
  }

}