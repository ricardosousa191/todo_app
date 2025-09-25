import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

class Tasktile extends StatefulWidget {
  final Task task;
  Tasktile(this.task, {super.key});

  @override
  _TasktileState createState() => _TasktileState();
}

class _TasktileState extends State<Tasktile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.task.title),
      value: widget.task.isDone,
      onChanged: (bool? value) {
        setState(() {
          widget.task.isDone = value ?? false;
        });
      },
    );
  }
}
