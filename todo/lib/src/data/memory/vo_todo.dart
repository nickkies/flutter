import 'todo_status.dart';

class Todo {
  int id;
  String title;
  final DateTime createdDate;
  DateTime? updatedDate;
  DateTime dueDate;
  TodoStatus todoStatus;

  Todo({
    required this.id,
    required this.title,
    required this.dueDate,
    this.todoStatus = TodoStatus.incomplete,
  }) : createdDate = DateTime.now();
}
