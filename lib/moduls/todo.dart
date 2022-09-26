class Todo {
  int? id;
  int? categoryId;
  String? title;
  String? description;
  Status? status;
  Priority? priority;
  DateTime cteatedAt=DateTime.now();

  Todo({this.id,this.categoryId, this.title, this.description, this.status=Status.active,this.priority=Priority.unclassified});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'categoryId': categoryId,
      'priority': priority,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      categoryId: map['categoryId'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      status: map['status'] as Status,
      priority: map['priority'] as Priority,
    );
  }
}
enum Status{
  active,
  disabled,
  deleted,
  inProgress,
  terminated
}

enum Priority{
  minor,
  major,
  unclassified
}