import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoflutter/screens/task_screen.dart';
import 'dart:collection';

import 'controller/list_tasks.dart';
import 'models/task.dart';

void main() {
  runApp((ToDoApp()));
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListTasks>(
      create: (context) => ListTasks(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: TaskScreen(),
      ),
    );
  }
}
