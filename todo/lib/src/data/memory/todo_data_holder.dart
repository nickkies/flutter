import 'package:flutter/material.dart';
import 'package:todo/src/data/memory/todo_data_notifier.dart';

import 'todo_status.dart';
import 'vo_todo.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({
    super.key,
    required super.child,
    required this.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
  }

  void changeTodoStatus(Todo todo) {
    switch (todo.todoStatus) {
      case TodoStatus.incomplete:
        todo.todoStatus = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.todoStatus = TodoStatus.complete;
      case TodoStatus.complete:
        todo.todoStatus = TodoStatus.incomplete;
    }
    notifier.notify();
  }
}

extension TodoDataHolderContextExtention on BuildContext {
  TodoDataHolder get holder => TodoDataHolder._of(this);
}
