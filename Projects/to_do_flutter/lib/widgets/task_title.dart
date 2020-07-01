import 'package:flutter/material.dart';
import 'package:todoflutter/constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkboxCallback;
  final Function longPressDeleted;

  TaskTile(
      {
        this.isChecked,
      this.title,
      this.checkboxCallback,
   this.longPressDeleted
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      onLongPress: longPressDeleted,
      trailing: Checkbox(
        checkColor: Colors.black,
        activeColor: colorPrimary,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
