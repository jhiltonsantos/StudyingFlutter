import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoflutter/constants.dart';
import 'package:todoflutter/controller/list_tasks.dart';


class AddTaskScreen extends StatelessWidget {

  String taskAdd;
  final addToDoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xBC000000),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          color: Color(0xFF2E2E2E),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Adicionar Tarefa',
              textAlign: TextAlign.center,
              style: TextStyle(color: colorPrimary, fontSize: 28.0),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: TextField(
                  controller: addToDoController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  cursorColor: colorPrimary,
                  decoration: InputDecoration(fillColor: colorPrimary),
                  onChanged: (value) {
                    taskAdd = value;
                  },
                )),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: FlatButton(
                color: colorPrimary,
                child: Text(
                  'Adicionar',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  if (taskAdd != null) {
                    Provider.of<ListTasks>(context, listen: false).taskAdd(taskAdd);
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



