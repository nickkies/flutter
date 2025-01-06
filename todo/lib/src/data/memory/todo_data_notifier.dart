import 'package:flutter/cupertino.dart';

import 'vo_todo.dart';

class TodoDateNotifier extends ValueNotifier<List<Todo>> {
  TodoDateNotifier() : super([]);

  void addTodo(Todo todo) {
    value.add(todo);
    notifyListeners();
  }
}
