import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoflutter/screens/task_screen.dart';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';

final _fireStore = Firestore.instance;

class ListTasks extends ChangeNotifier {
  List<Task> tasks = [];

  int get taskLength => tasks.length;


  void taskAdd(String newTaskTitle) {
    final task = Task(title: newTaskTitle);
    tasks.add(task);
    firebaseAdd(newTaskTitle);
    notifyListeners();
  }

  void firebaseAdd (String task) {
    _fireStore.collection('todoList').add({
      'todo_text': task,
      'date' :  DateTime.now().toIso8601String().toString(),
    });
  }

  void taskUpdate(Task task) {
    task.taskDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
