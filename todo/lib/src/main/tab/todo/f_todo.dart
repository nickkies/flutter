import 'package:flutter/material.dart';
import 'package:todo/src/data/memory/todo_data_holder.dart';
import 'package:todo/src/main/tab/todo/w_todo_item.dart';

class TodoFragment extends StatelessWidget {
  const TodoFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TodoDataHolder.of(context).notifier,
      builder: (context, todoList, child) => todoList.isEmpty
          ? Center(
              child: Text('할일을 작성해 주세요.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )))
          : SingleChildScrollView(
              child: Column(
                children: todoList
                    .expand(
                        (todo) => [TodoItem(todo), const SizedBox(height: 10)])
                    .toList(),
              ),
            ),
    );
  }
}
