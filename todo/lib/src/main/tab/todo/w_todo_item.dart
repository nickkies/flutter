import 'package:flutter/material.dart';
import 'package:todo/src/data/memory/vo_todo.dart';
import 'package:todo/src/main/tab/todo/w_todo_status.dart';
import 'package:todo/src/utils/date_extention.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: theme.highlightColor,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 5, top: 15, right: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(todo.dueDate.relativeDays),
            Row(children: [
              TodoStatusWidget(todo),
              Expanded(
                child: Text(
                  todo.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
