import 'package:flutter/material.dart';

class WriteTodoDialog extends StatefulWidget {
  const WriteTodoDialog({super.key});

  @override
  State<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends State<WriteTodoDialog> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Stateful Bottom Dialog',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Counter: $_counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('Increment'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
