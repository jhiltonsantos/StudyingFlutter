import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoflutter/controller/list_tasks.dart';
import 'task_title.dart';

final _firestore = Firestore.instance;

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('todoList').orderBy('date').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final todo = snapshot.data.documents.reversed;
          List<Widget> todoList = [];
          int tamanho = 0;

          for (var td in todo) {
            final todoText = td.data['todo_text'];
            final todoDate = td.data['date'];

            final textToDo = TextInListView(text: todoText,);
            todoList.add(textToDo);
            tamanho++;
          }

          final len = tamanho;

          return Consumer<ListTasks>(
            builder: (context, taskList, child) {
              return ListView(
                children: todoList,
              );
            },

          );
        });
  }
}

class TextInListView extends StatelessWidget {
  final String text;

  const TextInListView({Key key, this.text});

  @override
  Widget build(BuildContext context) {
    return TaskTile(
      title: text,
    );
  }
}


//class TasksList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<ListTasks>(
//      builder: (context, taskList, child) {
//        return ListView.builder(
//          itemBuilder: (context, index) {
//            final taskItem = taskList.tasks[index];
//            return TaskTile(
//              title: taskItem.title,
//              isChecked: taskItem.isDone,
//              checkboxCallback: (value) {
//                taskList.taskUpdate(taskItem);
//              },
//              longPressDeleted: () {
//                taskList.deleteTask(taskItem);
//              },
//            );
//          },
//          itemCount: taskList.taskLength,
//        );
//      },
//    );
//  }
//}
