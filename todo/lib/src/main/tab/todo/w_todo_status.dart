import 'package:flutter/material.dart';
import 'package:todo/src/data/memory/todo_data_holder.dart';
import 'package:todo/src/data/memory/todo_status.dart';
import 'package:todo/src/data/memory/vo_todo.dart';
import 'package:todo/src/main/common/widget/w_tap.dart';

class TodoStatusWidget extends StatelessWidget {
  final Todo todo;

  const TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        context.holder.changeTodoStatus(todo);
      },
      child: SizedBox(
          width: 50,
          height: 50,
          child: switch (todo.todoStatus) {
            TodoStatus.incomplete => Checkbox(value: false, onChanged: null),
            TodoStatus.complete => Checkbox(
                value: true,
                onChanged: null,
                fillColor: WidgetStateProperty.all(Colors.green),
              ),
            TodoStatus.ongoing => Checkbox(
                value: false,
                onChanged: null,
                fillColor: WidgetStateProperty.all(Colors.orange),
              ),
          }),
    );
  }
}
