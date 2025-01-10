import 'package:flutter/material.dart';
import 'package:todo/src/data/memory/todo_data_holder.dart';

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
          : Column(children: todoList.map((e) => Text(e.title)).toList()),
    );
  }
}
