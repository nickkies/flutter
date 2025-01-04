import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/main/write/vo_write_to_result.dart';

class WriteTodoDialog extends StatefulWidget {
  const WriteTodoDialog({super.key});

  @override
  State<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends State<WriteTodoDialog>
    with AfterLayoutMixin {
  DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Text(
                '할일을 작성해 주세요.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(_selectedDate.toString().split(' ')[0]),
              IconButton(
                onPressed: _selectDate,
                icon: const Icon(Icons.calendar_month),
              )
            ]),
            SizedBox(height: 20),
            Row(children: [
              Expanded(
                child: TextField(
                  focusNode: focusNode,
                  controller: textController,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      WriteToResultVo(
                        text: textController.text,
                        date: _selectedDate,
                      ),
                    );
                  },
                  child: Text('추가')),
            ]),
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
    );

    if (date == null) return;

    setState(() {
      _selectedDate = date;
    });
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
